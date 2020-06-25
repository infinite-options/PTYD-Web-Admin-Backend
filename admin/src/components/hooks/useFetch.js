import { useState, useEffect } from "react";

export default function useFetch(url, date) {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  useEffect(() => {
    const doFetch = async () => {
      setLoading(true);
      try {
        const res = await fetch(url);
        const json = await res.json();

        setData(json.result.result);
      } catch (error) {
        setError(true);
      }
      setLoading(false);
    };
    doFetch();
  }, [date]);

  return { data, loading, error };
}
