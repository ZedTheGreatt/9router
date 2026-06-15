import { headers } from "next/headers";
import WebProvidersContent from "./WebProvidersContent";

/**
 * Web media providers page.
 *
 * headers() call forces Next.js to treat this route as dynamic, preventing
 * static prerendering which breaks client-only hooks (useRouter, useState, etc).
 */
export default async function WebProvidersPage() {
  await headers();
  return <WebProvidersContent />;
}
