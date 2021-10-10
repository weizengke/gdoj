package com.util;

import com.gdoj.oauth.vo.OAuth;
import net.sf.json.JSONObject;
import org.apache.http.Header;
import org.apache.http.message.BasicHeader;

import java.util.HashMap;
import java.util.Map;

public class GiteeOAuth {
    private String charset = "utf-8";
    private HttpClientUtil httpClientUtil = null;

    public GiteeOAuth(){
        httpClientUtil = new HttpClientUtil();
    }

    public String getToken(String client_id, String client_secret, String code){
        try {
            String redirect_url = Config.getValue("GITEE_REDIRECT_URL");
            String url = "https://gitee.com/oauth/token" ;
            url += "?grant_type=authorization_code";
            url += "&code="+code;
            url += "&client_id="+client_id;
            url += "&redirect_uri="+redirect_url;
            url += "&client_secret="+client_secret;

            Map<String,String> createMap = new HashMap<String,String>();
            //createMap.put("client_secret", client_secret);
            //createMap.put("redirect_uri", "http://127.0.0.1/gdoj");
            System.out.println("gitee:"+url);
            Header[] headers = {
                    //new BasicHeader("accept", "application/json")
            };
            String json = httpClientUtil.doPost(url, headers, createMap, charset);
            System.out.println(json);
            //{"access_token":"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","token_type":"bearer","scope":""}
            JSONObject jsonObject = JSONObject.fromObject(json);
            Map<String, String> map = (Map<String, String>) JSONObject.toBean(jsonObject, Map.class);
            System.out.println(map);
            //for (String key : map.keySet()) {
            //    System.out.println("key= "+ key + " and value= " + map.get(key));
            //}
            //access_token=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&scope=&token_type=bearer
            return map.get("access_token");
        } catch (Exception e) {
            // TODO: handle exception

            return null;
        }
    }
    public OAuth getUserInfo(String token){
        try {
            String url = "https://gitee.com/api/v5/user?access_token="+token;
            Header[] headers = {
                    new BasicHeader("accept", "application/json"),
            };
            String json = httpClientUtil.doGet(url, headers, charset);
            System.out.println(json);
            JSONObject jsonObject = JSONObject.fromObject(json);
            Map<String, String> map = (Map<String, String>) JSONObject.toBean(jsonObject, Map.class);
            System.out.println(map);
            OAuth oauth = new OAuth();
            oauth.setProvider("gitee");
            oauth.setLogin(map.get("login"));
            oauth.setNickname(map.get("name"));
            oauth.setAvatar_url(map.get("avatar_url"));

            return oauth;
        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }
    public OAuth login(String client_id, String client_secret, String code){
        String token = getToken(client_id, client_secret, code);
        if (token == null) {
            return null;
        }
        System.out.println(token);
        return getUserInfo(token);
    }

    public static void main(String[] args){
        GiteeOAuth github = new GiteeOAuth();
        // https://github.com/login/oauth/authorize?client_id=1e4854a69a833e13c195
        //github.login("1e4854a69a833e13c195","0fc4a364989d19d9ad9e326e8d10f23e9e10d171 ","50f766c5a8249a1c0fe8");
        //main.test2();
        String json = "{\"access_token\":\"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\",\"token_type\":\"bearer\",\"scope\":\"\"}";
        JSONObject jsonObject = JSONObject.fromObject(json);
        Map<String, String> map = (Map<String, String>) JSONObject.toBean(jsonObject, Map.class);
        System.out.println(map);
        for (String key : map.keySet()) {
            System.out.println("key= "+ key + " and value= " + map.get(key));
        }
    }
}