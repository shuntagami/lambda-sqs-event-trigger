import type { QueuedMessage } from "./queued-message.interface";
import type { Message } from "./message.interface";
import type { DequeuedMessage } from "./dequeued-message.interface";

export interface QueueService {
  enqueueMessage(message: Message): Promise<QueuedMessage>;
  deleteMessages(messageHeaders: DequeuedMessage[]): Promise<void>;
}
