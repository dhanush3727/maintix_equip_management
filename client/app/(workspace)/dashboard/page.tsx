"use client";

import { useCurrentUser } from "@/hooks";

export default function Dashboard() {
  const { data } = useCurrentUser();

  console.log(data);

  return <div>Dashboard</div>;
}
