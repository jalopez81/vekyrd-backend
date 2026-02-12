import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

export const getProductImageUrls = (sku) => {
  const urls = [];

  for (let i = 1; i <= 3; i++) {
    const filePath = `${sku}-${i}.jpg`;

    const { data } = supabase
      .storage
      .from('product-images')
      .getPublicUrl(filePath);

    urls.push(data?.publicUrl || null);
  }

  return urls;
};
