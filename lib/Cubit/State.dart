abstract class state{}
class InitialState extends state{}
class ChangeBottonNavigationBar extends state{}
class LoadingBussinessNews extends state{}
class SuccessfulBussinessNews extends state{}
class ErrorBussinessNews extends state{
  final String error;
  ErrorBussinessNews(this.error);
}
class LoadingSportsNews extends state{}
class SuccessfulSportsNews extends state{}
class ErrorSportsNews extends state{
  final String error;
  ErrorSportsNews(this.error);
}
class LoadingScienceNews extends state{}
class SuccessfulScienceNews extends state{}
class ErrorSciencesNews extends state{
  final String error;
  ErrorSciencesNews(this.error);
}
class LoadingSearchNews extends state{}
class SuccessfulSearchNews extends state{}
class ErrorSearchNews extends state{
  final String error;
  ErrorSearchNews(this.error);
}
class ChangeModeApp extends state{}