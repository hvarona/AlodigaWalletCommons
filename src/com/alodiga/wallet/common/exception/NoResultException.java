package com.alodiga.wallet.common.exception;

import org.apache.log4j.Logger;

public class NoResultException extends Exception {

    private static final long serialVersionUID = 1L;

    public NoResultException(String message) {
        super(message);
    }

    public NoResultException(Logger logger, String message, Exception e) {
        super(message, e);
        logger.error(message, e);
    }

    public NoResultException(String message, StackTraceElement[] stackTrace) {
        super(message);
        setStackTrace(stackTrace);
    }
}
