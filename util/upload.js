import multer from "multer";
import mime from "mime-types";

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/images');
    },
    filename: function (req, file, cb) {
        const timestamp = Date.now();
        const randomSuffix = Math.floor(Math.random() * 100);
        const fileExtension = mime.extension(file.mimetype);

        const filename = `donation-${timestamp}${randomSuffix}.${fileExtension}`;
        cb(null, filename);
    }
});

const upload = multer({ storage });

export default upload;
