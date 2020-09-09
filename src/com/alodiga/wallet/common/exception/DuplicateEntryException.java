package com.alodiga.wallet.common.exception;

import org.apache.log4j.Logger;

public class DuplicateEntryException extends Exception {

    private static final long serialVersionUID = 1L;

    public DuplicateEntryException(String message) {
        super(message);
    }

    public DuplicateEntryException(Logger logger, String message, Exception e) {
        super(message, e);
        logger.error(message, e);
    }

    public DuplicateEntryException(String message, StackTraceElement[] stackTrace) {
        super(message);
        setStackTrace(stackTrace);
    }

}
