const AWS = require('aws-sdk'); // AWS SDK를 사용하기 위한 모듈을 가져옵니다.
const multer = require('multer'); // 파일 업로드를 처리하기 위한 multer 모듈을 가져옵니다.
const multerS3 = require('multer-s3'); // AWS S3 스토리지를 사용하기 위한 multer-s3 모듈을 가져옵니다.
const path = require('path'); // 파일 경로를 조작하기 위한 모듈을 가져옵니다.
require('dotenv').config(); // .env 파일에서 환경 변수를 로드하기 위한 모듈을 가져옵니다.
const { S3Client } = require('@aws-sdk/client-s3'); // AWS SDK의 S3 클라이언트 모듈을 가져옵니다.

const s3Client = new S3Client({
  region: 'ap-northeast-2', // AWS S3 리전을 설정합니다.
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID, // AWS 엑세스 키 ID를 .env 파일에서 로드합니다.
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY, // AWS 시크릿 엑세스 키를 .env 파일에서 로드합니다.
  },
});

const allowedExtensions = ['.png', '.jpg', '.jpeg', '.bmp', '.gif']; // 허용된 파일 확장자 목록을 정의합니다.

const imageUploader = multer({
  storage: multerS3({
    s3: s3Client, // AWS S3 클라이언트를 사용하여 파일을 업로드할 스토리지를 설정합니다.
    bucket: 'hoki', // 업로드할 S3 버킷 이름을 설정합니다.
    contentType: multerS3.AUTO_CONTENT_TYPE, // 파일의 컨텐츠 타입을 자동으로 설정합니다.

    key: (req, file, callback) => {
      const uploadDirectory = req.query.directory ?? ''; // 업로드 디렉토리를 쿼리 매개변수로부터 가져오며, 값이 없을 경우 빈 문자열로 설정합니다.

      const extension = path.extname(file.originalname); // 파일의 확장자를 가져옵니다.

      if (!allowedExtensions.includes(extension)) {
        return callback(new Error('wrong extension')); // 허용된 확장자 목록에 없는 확장자의 파일이 업로드되면 오류를 발생시킵니다.
      }

      // 파일 이름을 생성합니다. 이 경우, 업로드 디렉토리와 고유한 타임스탬프와 원본 파일 이름을 조합합니다.
      callback(null, `${uploadDirectory}/${Date.now()}_${file.originalname}`);
    },
    acl: 'public-read-write', // 업로드된 파일에 대한 ACL(Access Control List)을 설정합니다.
  }),

  fileFilter: (req, file, callback) => {
    const extension = path.extname(file.originalname); // 파일의 확장자를 가져옵니다.

    if (!allowedExtensions.includes(extension)) {
      return callback(new Error('wrong extension')); // 허용된 확장자 목록에 없는 확장자의 파일이 업로드되면 오류를 발생시킵니다.
    }

    callback(null, true); // 파일이 허용된 확장자를 가지고 있으면 업로드를 허용합니다.
  },
});

module.exports = { imageUploader }; // imageUploader 미들웨어를 내보냅니다.
