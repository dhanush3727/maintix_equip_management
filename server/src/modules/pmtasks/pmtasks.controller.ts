import { Controller } from '@nestjs/common';
import { PmtasksService } from './pmtasks.service';

@Controller('pmtasks')
export class PmtasksController {
  constructor(private pmtask: PmtasksService) {}
}
