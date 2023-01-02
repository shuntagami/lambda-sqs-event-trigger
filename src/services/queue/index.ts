import type { QueueService } from "./../../interfaces/queue-service.interface";
import {
  AWS_REGION,
  // ENVIRONMENT,
} from "./../../constants/environment.constants";
import { SqsQueueService } from "./sqs-queue.service";
import * as SQS from "aws-sdk/clients/sqs";
// import { Environment } from "../../enums/environment.enum";
// import { LocalQueueService } from "./local-queue.service";
import { logService } from "../log";

const sqsClient = new SQS({
  region: AWS_REGION,
});

export const queueService: QueueService = new SqsQueueService(sqsClient);
// ENVIRONMENT === Environment.LOCAL
//   ? new LocalQueueService(logService)
//   : new SqsQueueService(sqsClient);
