import { Module } from '@nestjs/common';
import { BreakdownService } from './breakdown.service';
import { BreakdownController } from './breakdown.controller';

@Module({
  providers: [BreakdownService],
  controllers: [BreakdownController],
})
export class BreakdownModule {}
