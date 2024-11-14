import { render } from "preact";
import "./index.css";
import Auth from "@/Auth";
import { createClient } from "@supabase/supabase-js";
import { useState, useEffect } from "react";
import { Session } from "@supabase/supabase-js";
import Dashboard from "@/app/dashboard/page";

const supabase = createClient(
  import.meta.env.VITE_SUPABASE_URL,
  import.meta.env.VITE_SUPABASE_JWT
);

function App() {
  const [session, setSession] = useState<Session | null>(null);

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      return setSession(session);
    });

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session);
    });

    return () => subscription.unsubscribe();
  }, []);

  if (!session) {
    return <Auth />;
  } else {
    return <Dashboard />;
  }
}

render(<App />, document.getElementById("app")!);
