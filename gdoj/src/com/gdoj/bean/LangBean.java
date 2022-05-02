package com.gdoj.bean;

public class LangBean {
    private Integer id;
    private Integer local_lang_id;
    private String   langName;

    public LangBean(Integer id, Integer local_lang_id, String langName) {
        this.id = id;
        this.local_lang_id = local_lang_id;
        this.langName = langName;
    }

    public Integer getId() {
        return id;
    }

    public String getLangName() {
        return langName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setLangName(String langName) {
        this.langName = langName;
    }

    public Integer getLocal_lang_id() {
        return local_lang_id;
    }

    public void setLocal_lang_id(Integer local_lang_id) {
        this.local_lang_id = local_lang_id;
    }
}
