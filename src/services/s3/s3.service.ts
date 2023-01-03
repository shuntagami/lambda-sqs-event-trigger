import { S3_BUCKET_NAME } from "../../constants/environment.constants";
import type { StorageService } from "../../interfaces/storage-service.interface";
import { S3Client, PutObjectCommand } from "@aws-sdk/client-s3";

export class S3Service implements StorageService {
  constructor(private readonly s3Client: S3Client) {}

  async uploadWithBytes(
    data: Uint8Array,
    key: string,
    bucket = S3_BUCKET_NAME
  ): Promise<void> {
    const command = new PutObjectCommand({
      Bucket: bucket,
      Key: key,
      Body: data,
    });
    const result = await this.s3Client.send(command);
  }
}
