import { S3Client } from "@aws-sdk/client-s3";
import { AWS_REGION } from "./../../constants/environment.constants";
import type { StorageService } from "../../interfaces/storage-service.interface";
import { S3Service } from "./s3.service";

const client = new S3Client({
  region: AWS_REGION,
});

export const storageService: StorageService = new S3Service(client);
