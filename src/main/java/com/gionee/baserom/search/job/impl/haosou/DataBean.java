package com.gionee.baserom.search.job.impl.haosou;

public class DataBean {
    public String title;
    public String search_word;
    public int n;
    public String recordTime;
    public String stats;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSearch_word() {
        return search_word;
    }

    public void setSearch_word(String search_word) {
        this.search_word = search_word;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime;
    }

    public String getStats() {
        return stats;
    }

    public void setStats(String stats) {
        this.stats = stats;
    }

    @Override
    public String toString() {
        return "DataBean [title=" + title + ", search_word=" + search_word + ", n=" + n + ", recordTime=" + recordTime
                + ", stats=" + stats + "]";
    }

}
