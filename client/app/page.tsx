"use client";

import { useMeta } from "@/hooks/queries/useMeta";

export default function Home() {
  const { data, isPending, error } = useMeta();
  console.log(data);
  console.log(isPending);
  console.log(error);
  return <div></div>;
}
