package com.song.model;

public class TrainCheckEntity {
    private Integer checkId;

    private Integer trainId;

    private Integer userId;

    private String trueOption;

    private String myOption;

    public Integer getCheckId() {
        return checkId;
    }

    public void setCheckId(Integer checkId) {
        this.checkId = checkId;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTrueOption() {
        return trueOption;
    }

    public void setTrueOption(String trueOption) {
        this.trueOption = trueOption == null ? null : trueOption.trim();
    }

    public String getMyOption() {
        return myOption;
    }

    public void setMyOption(String myOption) {
        this.myOption = myOption == null ? null : myOption.trim();
    }
}