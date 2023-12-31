package advancedJava.dayFifth.userExample;

import advancedJava.dayFifth.exceptionExamples.DatabaseConnectException;
import advancedJava.dayFifth.exceptionExamples.FileAccessException;
import advancedJava.dayFifth.exceptionExamples.ValidationException;

public class DataProcessor {
    public static final String FILE_ACCESS_EXCEPTION = "Błąd dostępu";
    public void process(String data) throws ValidationException
            , FileAccessException, DatabaseConnectException {
        if (data == null || data.isEmpty()) {
            throw new ValidationException("Dane są niepoprawne");
        }
        //try {
            //otwarcie pliku
            fakeOpenFile(data);
            fakeDatabaceConnection(data);
        //} catch ()
    }
    private void fakeOpenFile(String data) throws  FileAccessException {
        //
        if (data.equalsIgnoreCase("Brak dostępu")) {
            throw new FileAccessException(FILE_ACCESS_EXCEPTION);
        }
    }
    private void fakeDatabaceConnection(String data) throws DatabaseConnectException {
        if (data.equalsIgnoreCase("Błąd przetwarzania"))
        System.out.println("przetwarz data");
        throw new DatabaseConnectException("Błąd przetwarzania");
    }
}
