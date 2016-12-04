package com.fluxcapacitor;

// Derived from the following:
//   https://github.com/tobegit3hub/deep_recommend_system/blob/master/java_predict_client/src/main/java/com/tobe/PredictClient.java

import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.StatusRuntimeException;
import org.tensorflow.framework.TensorProto;
import org.tensorflow.framework.TensorShapeProto;
import tensorflow.serving.Model;
import tensorflow.serving.Predict;
import tensorflow.serving.PredictionServiceGrpc;

import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * The general predit client for TensorFlow models.
 */
public class TensorflowPredictionClientGrpc {
    private static final Logger logger =
      Logger.getLogger(TensorflowPredictionClientGrpc.class.getName());
    private final ManagedChannel channel;
    private final PredictionServiceGrpc.PredictionServiceBlockingStub blockingStub;

    // Initialize gRPC client
    public TensorflowPredictionClientGrpc(String host, int port)
    {
        channel = ManagedChannelBuilder.forAddress(host, port)
                // Channels are secure by default (via SSL/TLS). For the example we disable TLS to avoid
                // needing certificates.
                .usePlaintext(true)
                .build();

        blockingStub = PredictionServiceGrpc.newBlockingStub(channel);
    }

    public static void main(String[] args) {
        System.out.println("Start the predict client");

        String host = "127.0.0.1";
        int port = 9091;
        String modelName = "cancer";
        long modelVersion = 1;
        String inputJson = "";

        // Parse command-line arguments
        if (args.length == 5) {
            host = args[0];
            port = Integer.parseInt(args[1]);
            modelName = args[2];
            modelVersion = Long.parseLong(args[3]);
            inputJson = args[4];
        }

        // Run predict client to send request
        TensorflowPredictionClientGrpc client = 
          new TensorflowPredictionClientGrpc(host, port);

        try {
            client.predict(modelName, modelVersion, inputJson);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                client.shutdown();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        System.out.println("End of predict client");
    }

    public void shutdown() throws InterruptedException {
        channel.shutdown().awaitTermination(5, TimeUnit.SECONDS);
    }

    public void predict(String modelName, long modelVersion, String inputJson) {
        // Generate keys TensorProto
        int[][] keysTensorData = new int[][]{
                {1},
                {2}
        };

        TensorProto.Builder keysTensorBuilder = TensorProto.newBuilder();
        keysTensorBuilder.setDtype(org.tensorflow.framework.DataType.DT_INT32);

        for (int i = 0; i < keysTensorData.length; ++i) {
            for (int j = 0; j < keysTensorData[i].length; ++j) {
                keysTensorBuilder.addIntVal(keysTensorData[i][j]);
            }
        }

        TensorProto keysTensorProto = keysTensorBuilder.build();

        // Generate features TensorProto
        float[][] featuresTensorData = new float[][]{
                {10f, 10f, 10f, 8f, 6f, 1f, 8f, 9f, 1f},
                {10f, 10f, 10f, 8f, 6f, 1f, 8f, 9f, 1f},
        };

        TensorProto.Builder featuresTensorBuilder = TensorProto.newBuilder();
        featuresTensorBuilder.setDtype(org.tensorflow.framework.DataType.DT_FLOAT);

        for (int i = 0; i < featuresTensorData.length; ++i) {
            for (int j = 0; j < featuresTensorData[i].length; ++j) {
                featuresTensorBuilder.addFloatVal(featuresTensorData[i][j]);
            }
        }

        TensorShapeProto.Dim dim1 = TensorShapeProto.Dim.newBuilder().setSize(2).build();
        TensorShapeProto.Dim dim2 = TensorShapeProto.Dim.newBuilder().setSize(9).build();
        TensorShapeProto shape = TensorShapeProto.newBuilder().addDim(dim1).addDim(dim2).build();
        featuresTensorBuilder.setTensorShape(shape);
        TensorProto featuresTensorProto = featuresTensorBuilder.build();

        // Generate gRPC request
        com.google.protobuf.Int64Value version =
          com.google.protobuf.Int64Value.newBuilder().setValue(modelVersion).build();
        Model.ModelSpec modelSpec =
          Model.ModelSpec.newBuilder().setName(modelName).setVersion(version).build();
        Predict.PredictRequest request = Predict.PredictRequest.newBuilder()
          .setModelSpec(modelSpec).putInputs("features", featuresTensorProto)
          .putInputs("keys", keysTensorProto).build();

        // Request gRPC server
        Predict.PredictResponse response;
        try {
            response = blockingStub.predict(request);
            java.util.Map<java.lang.String, org.tensorflow.framework.TensorProto> outputs
              = response.getOutputs();
            for (java.util.Map.Entry<java.lang.String, 
                 org.tensorflow.framework.TensorProto> entry : outputs.entrySet()) {
              System.out.println("Response with the key: " + entry.getKey() + ", value: " 
                 + entry.getValue());
            }
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC failed: {0}", e.getStatus());
            return;
        }
    }
}
