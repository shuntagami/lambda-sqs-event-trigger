import { S3Client } from "@aws-sdk/client-s3";
import {
  AWS_ACCESS_KEY_ID,
  AWS_REGION,
  AWS_SECRET_ACCESS_KEY,
  S3_ENDPOINT,
} from "./../../constants/environment.constants";
import type { StorageService } from "../../interfaces/storage-service.interface";
import { S3Service } from "./s3.service";

let credentials = undefined;
if (AWS_ACCESS_KEY_ID && AWS_SECRET_ACCESS_KEY) {
  credentials = {
    accessKeyId: AWS_ACCESS_KEY_ID,
    secretAccessKey: AWS_SECRET_ACCESS_KEY,
  };
}

const client = new S3Client({
  credentials: credentials,
  region: AWS_REGION,
  endpoint: S3_ENDPOINT,
  forcePathStyle: true,
});

export const storageService: StorageService = new S3Service(client);
