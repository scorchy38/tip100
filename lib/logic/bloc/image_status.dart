abstract class ImageSubmissionStatus {
  const ImageSubmissionStatus();
}

class InitialImageStatus extends ImageSubmissionStatus {
  const InitialImageStatus();
}

class ImageSubmitting extends ImageSubmissionStatus {}

class ImageSubmissionSuccess extends ImageSubmissionStatus {}

class ImageSubmissionFailed extends ImageSubmissionStatus {}
