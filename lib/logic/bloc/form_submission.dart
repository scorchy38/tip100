abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final String exception;
  SubmissionFailed({required this.exception});
}

class FormSubmitNow extends FormSubmissionStatus {}

class SubmissionSuccessFacebook extends FormSubmissionStatus {
  // final UserCredential credential;
  // SubmissionSuccessFacebook({required this.credential});
}

class SubmissionSuccessGoogle extends FormSubmissionStatus {
  // final UserCredential credential;
  // SubmissionSuccessGoogle({required this.credential});
}
