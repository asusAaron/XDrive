package com.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

public class ProgressBean {

    private long bytesRead;

    private long contentlen;

    private long items;

    public ProgressBean(long bytesRead, long contentlen, long items) {
        super();
        this.bytesRead = bytesRead;
        this.contentlen = contentlen;
        this.items = items;
    }

    public long getBytesRead() {
        return bytesRead;
    }

    public void setBytesRead(long bytesRead) {
        this.bytesRead = bytesRead;
    }

    public long getContentlen() {
        return contentlen;
    }

    public void setContentlen(long contentlen) {
        this.contentlen = contentlen;
    }

    public long getItems() {
        return items;
    }

    public void setItems(long items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "ProgressBean [bytesRead=" + bytesRead + ", contentLength="
                + contentlen+ ", items=" + items + "]";
    }


}
