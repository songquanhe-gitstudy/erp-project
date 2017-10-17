package com.song.model;

public class TrainExamEntity {
    private Integer examId;

    private Integer trainId;

    private String examTitle;

    private String aOption;

    private String bOption;

    private String cOption;

    private String dOption;

    private String trueOption;

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public String getExamTitle() {
        return examTitle;
    }

    public void setExamTitle(String examTitle) {
        this.examTitle = examTitle == null ? null : examTitle.trim();
    }

    public String getaOption() {
        return aOption;
    }

    public void setaOption(String aOption) {
        this.aOption = aOption == null ? null : aOption.trim();
    }

    public String getbOption() {
        return bOption;
    }

    public void setbOption(String bOption) {
        this.bOption = bOption == null ? null : bOption.trim();
    }

    public String getcOption() {
        return cOption;
    }

    public void setcOption(String cOption) {
        this.cOption = cOption == null ? null : cOption.trim();
    }

    public String getdOption() {
        return dOption;
    }

    public void setdOption(String dOption) {
        this.dOption = dOption == null ? null : dOption.trim();
    }

    public String getTrueOption() {
        return trueOption;
    }

    public void setTrueOption(String trueOption) {
        this.trueOption = trueOption == null ? null : trueOption.trim();
    }
}