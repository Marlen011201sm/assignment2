package kz.db.seiitzhan.marlen.controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.Builder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.LocalDateTime;

@RestControllerAdvice
public class DefaultController {
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public ResponseEntity<Error> handleGeneral(HttpServletRequest httpServletRequest, RuntimeException e) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                Error.builder()
                        .timestamp(LocalDateTime.now())
                        .status(HttpStatus.INTERNAL_SERVER_ERROR.value())
                        .error(HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase())
                        .path(httpServletRequest.getServletPath())
                        .message(e.getMessage())
                        .build()
        );
    }

    @Builder
    @AllArgsConstructor
    static class Error {
        LocalDateTime timestamp;
        Integer status;
        String message;
        String error;
        String path;
    }
}
