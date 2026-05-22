import {
  ExceptionFilter,
  Catch,
  ArgumentsHost,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import type { Response } from 'express';

@Catch() // Catch all exceptions
// This filter will handle all exceptions thrown in the application and format the response accordingly.
export class HttpExceptionFilter implements ExceptionFilter {
  // The catch method is called when an exception is thrown. It formats the response based on the type of exception.
  // host is an instance of ArgumentsHost, which provides methods to access the request and response objects.
  catch(exception: unknown, host: ArgumentsHost) {
    const context = host.switchToHttp();
    const response = context.getResponse<Response>();

    console.log(exception);

    // Default to 500 Internal Server Error for unhandled exceptions
    let statusCode = HttpStatus.INTERNAL_SERVER_ERROR;
    let message: string | string[] = 'Internal server error';

    // Handle known http exceptions
    if (exception instanceof HttpException) {
      statusCode = exception.getStatus(); // Get the HTTP status code from the exception

      const exceptionResponse = exception.getResponse(); // Get the response body from the exception, which may contain a message or error details

      // Determine the message to return based on the type of exception response
      // If the response is a string, use it directly as the message. If it's an object, try to extract a message or error field.
      if (typeof exceptionResponse === 'string') {
        message = exceptionResponse;
      } else if (
        typeof exceptionResponse === 'object' &&
        exceptionResponse !== null
      ) {
        const res = exceptionResponse as {
          message?: string | string[];
          error?: string;
        };
        message = res.message ?? res.error ?? message;
      }

      // If the message is an array, take the first element as the message
      if (Array.isArray(message)) {
        message = message[0];
      }
    }

    response.status(statusCode).json({
      success: false,
      message,
    });
  }
}
