import {
  Injectable,
  InternalServerErrorException,
  OnModuleInit,
} from '@nestjs/common';
import { v2 as cloudinary } from 'cloudinary';
import { ConfigService } from '@nestjs/config';
import * as streamifier from 'streamifier';

export type CloudinaryUploadResult = {
  url: string;
  publicId: string;
};

@Injectable()
export class CloudinaryService implements OnModuleInit {
  constructor(private readonly configService: ConfigService) {}

  onModuleInit() {
    const cloudName = this.configService.get<string>('cloudinary.cloudName');
    const apiKey = this.configService.get<string>('cloudinary.apiKey');
    const apiSecret = this.configService.get<string>('cloudinary.apiSecret');

    if (!cloudName || !apiKey || !apiSecret) {
      throw new Error('Cloudinary configuration is missing');
    }

    cloudinary.config({
      cloud_name: cloudName,
      api_key: apiKey,
      api_secret: apiSecret,
    });
  }

  //Upload a file
  async uploadFile(file: Express.Multer.File) {
    if (!file || !file.buffer) {
      throw new InternalServerErrorException('Invalid file');
    }

    return new Promise<CloudinaryUploadResult>((resolve, reject) => {
      const upload = cloudinary.uploader.upload_stream(
        { folder: 'maintix' },
        (error, result) => {
          if (error) {
            return reject(
              new InternalServerErrorException(
                error instanceof Error ? error.message : 'Upload failed',
              ),
            );
          }

          if (!result) {
            return reject(new InternalServerErrorException('Upload failed'));
          }

          resolve({
            url: result.secure_url,
            publicId: result.public_id,
          });
        },
      );

      streamifier.createReadStream(file.buffer).pipe(upload);
    });
  }

  // Delete a file
  async deleteFile(publicId: string) {
    try {
      const result = (await cloudinary.uploader.destroy(publicId)) as {
        result: string;
      };
      return result.result === 'ok';
    } catch (err) {
      throw new InternalServerErrorException(err);
    }
  }

  // Replace a file
  async replaceFile(publicId: string, file: Express.Multer.File) {
    await this.deleteFile(publicId);
    return this.uploadFile(file);
  }
}
