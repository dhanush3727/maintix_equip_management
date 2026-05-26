// This interceptor will format the response of all successful requests in a consistent way.
// It wraps the original response data in an object that includes a success flag and a message.
import {
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
} from '@nestjs/common';
import { map, Observable } from 'rxjs';

type PaginationInfo = {
  total: number;
  page: number;
  totalPages: number;
  limit: number;
};

// This interface defines the structure of the API response that will be sent to the client.
// T is a generic type that represents the type of the original response data from the controller.
// Example: If a controller method returns an object of type User, then ApiResponse<User> will be the type of the response sent to the client, which will include the original User data along with success and message fields.
interface ApiResponse<T> {
  success: boolean;
  message: string;
  data?: T;
  pagination?: PaginationInfo;
}

@Injectable()
export class ResponseInterceptor<T> implements NestInterceptor<
  T, // The first generic parameter is the type of the original response data from the controller.
  ApiResponse<T> // The second generic parameter is the type of the response that will be sent to the client after transformation.
> {
  intercept(
    context: ExecutionContext,
    next: CallHandler<T>, // The CallHandler is typed with T, which means it will handle an Observable that emits data of type T (the original response from the controller).
  ): Observable<ApiResponse<T>> | Promise<Observable<ApiResponse<T>>> {
    //  The next.handle() method returns an Observable that emits the original response data of type T from the controller.
    // pipe() is used to modify or react to that observable stream.
    // We use the pipe() method to transform this Observable<T> into an Observable<ApiResponse<T>> by applying the map operator.
    return next.handle().pipe(
      map((data) => {
        let message = 'Success'; // Default message if the controller does not provide one
        let responseData: T | undefined; // This will hold the original response data from the controller
        let pagination: PaginationInfo | undefined; // This will hold pagination info if provided by the controller

        // If the controller returns an object that contains a 'message' or 'data' field, we extract those to use in our response.
        // If not, return raw data as response data and use default message
        if (
          typeof data === 'object' &&
          data !== null &&
          ('data' in data || 'message' in data)
        ) {
          const res = data as {
            message?: string;
            data?: T;
            pagination?: PaginationInfo;
          };

          message = res.message ?? message;
          responseData = res.data;
          pagination = res.pagination;
        } else {
          responseData = data;
        }

        // We return an object that conforms to the ApiResponse<T> interface, which includes a success flag, a message, and the original response data from the controller.
        return {
          success: true,
          message,
          data: responseData,
          pagination,
        };
      }),
    );
  }
}

// If we want to change response use pip()
// Interceptor flow
// Controller → returns T
//         ↓
// Interceptor receives Observable<T>
//         ↓
// pipe() transforms T → ApiResponse<T>
//         ↓
// Client receives final response
