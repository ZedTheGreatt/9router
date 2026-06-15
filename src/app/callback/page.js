import { headers } from "next/headers";
import CallbackContent from "./CallbackContent";

/**
 * OAuth Callback Page
 * Receives callback from OAuth providers and sends data back via multiple methods
 *
 * headers() call forces Next.js to treat this route as dynamic, preventing
 * static prerendering which breaks client-only hooks (useSearchParams, etc).
 */
export default async function CallbackPage() {
  await headers();
  return <CallbackContent />;
}
