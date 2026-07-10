import {
  Avatar,
  AvatarFallback,
  AvatarGroup,
  AvatarGroupCount,
  AvatarImage,
} from "@/components/ui/avatar";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Separator } from "@/components/ui/separator";
import { Skeleton } from "@/components/ui/skeleton";
import { Textarea } from "@/components/ui/textarea";

export default function Home() {
  return (
    <>
      <div>lorem*200</div>
      <Button>Save</Button>
      <br />
      <br />
      <Input placeholder="Name" />
      <br />
      <br />
      <Label>Name</Label>
      <br />
      <br />
      <Textarea placeholder="Comments" />
      <br />
      <br />

      <Card className="max-w-md">
        <CardHeader>
          <CardTitle>Equipment Details</CardTitle>
          <CardDescription>
            Information about the selected equipment.
          </CardDescription>
        </CardHeader>

        <CardContent>
          <p>Name: CNC Machine</p>
          <p>Status: Active</p>
          <p>Location: Production Line 1</p>
        </CardContent>
      </Card>
      <br />
      <br />
      <Badge>Default</Badge>
      <Badge variant="secondary">Secondary</Badge>
      <Badge variant="destructive">destructive</Badge>
      <Badge variant="outline">outline</Badge>
      <Badge variant="ghost">ghost</Badge>
      <Badge variant="link">link</Badge>
      <Badge variant="success">success</Badge>
      <Badge variant="warning">warning</Badge>
      <Badge variant="info">info</Badge>
      <br />
      <br />
      <Separator />
      <br />
      <br />
      <Skeleton className="h-10 w-full" />
      <br />
      <br />
      <Avatar>
        <AvatarImage src="/users/dhanush.jpg" alt="Dhanush" />
        <AvatarFallback>DS</AvatarFallback>
      </Avatar>
      <AvatarGroup>
        <Avatar>
          <AvatarFallback>DS</AvatarFallback>
        </Avatar>

        <Avatar>
          <AvatarFallback>AR</AvatarFallback>
        </Avatar>

        <Avatar>
          <AvatarFallback>VK</AvatarFallback>
        </Avatar>

        <AvatarGroupCount>+8</AvatarGroupCount>
      </AvatarGroup>
      <br />
      <br />
      <ScrollArea className="h-80">
        <div className="space-y-4">
          {Array.from({ length: 5 }).map((_, index) => (
            <div key={index}>Name</div>
          ))}
        </div>
      </ScrollArea>
      <Card>
        <CardHeader>
          <CardTitle>Notifications</CardTitle>
        </CardHeader>

        <CardContent>
          <ScrollArea className="h-80">Notification</ScrollArea>
        </CardContent>
      </Card>
      <ScrollArea className="h-screen"></ScrollArea>
      <ScrollArea className="max-h-125">Dialog</ScrollArea>
      <ScrollArea className="h-125">Table</ScrollArea>
    </>
  );
}
