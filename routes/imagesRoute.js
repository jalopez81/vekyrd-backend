import express from 'express';
import multer from 'multer';
import sharp from 'sharp';

import { createClient } from '@supabase/supabase-js'
const supabase = createClient('https://bpcnwqzodpcbosgrcvdm.supabase.co', process.env.SUPABASE_SERVICE_ROLE_KEY);

const router = express.Router();
const storage = multer.memoryStorage();
const upload = multer({ storage });

router.post('/upload-product-image/:productSku', upload.array('images', 3), async (req, res) => {
  const { productSku } = req.params;
  const files = req.files;

  if (!files || files.length === 0) {
    return res.status(400).json({ message: 'No files uploaded' });
  }

  try {
    const uploads = await Promise.all(
      files.map(async (file, index) => {
        const filePath = `${productSku}-${index + 1}.jpg`;

        const { error } = await supabase.storage
          .from('product-images')
          .upload(filePath, file.buffer, {
            contentType: 'image/jpeg',
            upsert: true,
          });

        if (error) throw error;

        const { data } = supabase.storage
          .from('product-images')
          .getPublicUrl(filePath);

        return { file: filePath, url: data.publicUrl };
      })
    );

    res.status(200).json({ message: 'Upload successful', images: uploads });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ message: 'Upload failed', error: err.message });
  }
});



export default router;
