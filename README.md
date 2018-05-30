# react-native-sf-ums

# 分享

# 安装
> npm i react-native-sf-ums

1. 将 " umlibs " 下载放入工程target(就在GitHub上!)
2. 导入  
```
 libsqlite3.tbd
 CoreGraphics.framework
 SystemConfiguration.framework
 CoreTelephony.framework
 libsqlite3.tbd
 libc++.tbd
 libz.tbd
 Photos.framework
 ImageIO.framework
```


3. 配置白名单
```
<key>LSApplicationQueriesSchemes</key>
<array>
    <!-- 微信 URL Scheme 白名单-->
    <string>wechat</string>
    <string>weixin</string>

    <!-- 新浪微博 URL Scheme 白名单-->
    <string>sinaweibohd</string>
    <string>sinaweibo</string>
    <string>sinaweibosso</string>
    <string>weibosdk</string>
    <string>weibosdk2.5</string>

    <!-- QQ、Qzone URL Scheme 白名单-->
    <string>mqqapi</string>
    <string>mqq</string>
    <string>mqqOpensdkSSoLogin</string>
    <string>mqqconnect</string>
    <string>mqqopensdkdataline</string>
    <string>mqqopensdkgrouptribeshare</string>
    <string>mqqopensdkfriend</string>
    <string>mqqopensdkapi</string>
    <string>mqqopensdkapiV2</string>
    <string>mqqopensdkapiV3</string>
    <string>mqqopensdkapiV4</string>
    <string>mqzoneopensdk</string>
    <string>wtloginmqq</string>
    <string>wtloginmqq2</string>
    <string>mqqwpa</string>
    <string>mqzone</string>
    <string>mqzonev2</string>
    <string>mqzoneshare</string>
    <string>wtloginqzone</string>
    <string>mqzonewx</string>
    <string>mqzoneopensdkapiV2</string>
    <string>mqzoneopensdkapi19</string>
    <string>mqzoneopensdkapi</string>
    <string>mqqbrowser</string>
    <string>mttbrowser</string>
    <string>tim</string>
    <string>timapi</string>
    <string>timopensdkfriend</string>
    <string>timwpa</string>
    <string>timgamebindinggroup</string>
    <string>timapiwallet</string>
    <string>timOpensdkSSoLogin</string>
    <string>wtlogintim</string>
    <string>timopensdkgrouptribeshare</string>
    <string>timopensdkapiV4</string>
    <string>timgamebindinggroup</string>
    <string>timopensdkdataline</string>
    <string>wtlogintimV1</string>
    <string>timapiV1</string>

    <!-- 支付宝 URL Scheme 白名单-->
    <string>alipay</string>
    <string>alipayshare</string>

    <!-- 钉钉 URL Scheme 白名单-->
      <string>dingtalk</string>
      <string>dingtalk-open</string>

    <!--Linkedin URL Scheme 白名单-->
    <string>linkedin</string>
    <string>linkedin-sdk2</string>
    <string>linkedin-sdk</string>

    <!-- 点点虫 URL Scheme 白名单-->
    <string>laiwangsso</string>

    <!-- 易信 URL Scheme 白名单-->
    <string>yixin</string>
    <string>yixinopenapi</string>

    <!-- instagram URL Scheme 白名单-->
    <string>instagram</string>

    <!-- whatsapp URL Scheme 白名单-->
    <string>whatsapp</string>

    <!-- line URL Scheme 白名单-->
    <string>line</string>

    <!-- Facebook URL Scheme 白名单-->
    <string>fbapi</string>
    <string>fb-messenger-api</string>
    <string>fbauth2</string>
    <string>fbshareextension</string>

    <!-- Kakao URL Scheme 白名单-->  
    <!-- 注：以下第一个参数需替换为自己的kakao appkey--> 
    <!-- 格式为 kakao + "kakao appkey"-->    
    <string>kakaofa63a0b2356e923f3edd6512d531f546</string>
    <string>kakaokompassauth</string>
    <string>storykompassauth</string>
    <string>kakaolink</string>
    <string>kakaotalk-4.5.0</string>
    <string>kakaostory-2.9.0</string>

   <!-- pinterest URL Scheme 白名单-->  
    <string>pinterestsdk.v1</string>

   <!-- Tumblr URL Scheme 白名单-->  
    <string>tumblr</string>

   <!-- 印象笔记 -->
    <string>evernote</string>
    <string>en</string>
    <string>enx</string>
    <string>evernotecid</string>
    <string>evernotemsg</string>

   <!-- 有道云笔记-->
    <string>youdaonote</string>
    <string>ynotedictfav</string>
    <string>com.youdao.note.todayViewNote</string>
    <string>ynotesharesdk</string>

   <!-- Google+-->
    <string>gplus</string>

   <!-- Pocket-->
    <string>pocket</string>
    <string>readitlater</string>
    <string>pocket-oauth-v1</string>
    <string>fb131450656879143</string>
    <string>en-readitlater-5776</string>
    <string>com.ideashower.ReadItLaterPro3</string>
    <string>com.ideashower.ReadItLaterPro</string>
    <string>com.ideashower.ReadItLaterProAlpha</string>
    <string>com.ideashower.ReadItLaterProEnterprise</string>

   <!-- VKontakte-->
    <string>vk</string>
    <string>vk-share</string>
    <string>vkauthorize</string>

   <!-- Twitter-->
    <string>twitter</string>
    <string>twitterauth</string>
</array>
```
4. 配置 URL Type
```
平台	格式	举例	备注
微信	微信appKey	wxdc1e388c3822c80b	
QQ/Qzone	需要添加两项URL Scheme：
1、"tencent"+腾讯QQ互联应用appID
2、“QQ”+腾讯QQ互联应用appID转换成十六进制（不足8位前面补0）	如appID：100424468 1、tencent100424468 
2、QQ05fc5b14	QQ05fc5b14为100424468转十六进制而来，因不足8位向前补0，然后加"QQ"前缀
新浪微博	“wb”+新浪appKey	wb3921700954	
支付宝	“ap”+appID	ap2015111700822536	URL Type中的identifier填"alipayShare"
```

# 例子
```
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {Component} from 'react';
import {
    Platform,
    StyleSheet,
    Text,
    View
} from 'react-native';
import SFUM from 'react-native-sf-share'

const instructions = Platform.select({
    ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
    android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {
    render() {
        return (
            <View
                style={styles.container}>
                <Text
                    style={styles.welcome}
                    onPress={this.click}>
                    Welcome to React
                    Native!
                </Text>
                <Text
                    style={styles.instructions}>
                    To get started, edit
                    App.js
                </Text>
                <Text
                    style={styles.instructions}>
                    {instructions}
                </Text>
            </View>
        );
    }

    componentWillMount() {

    }

    click = () => {
        SFUM.shareBoard('nia',
            'http://kplan.oss-cn-shanghai.aliyuncs.com/header/2017-11-27_1511778896586',
            'http://kplan.oss-cn-shanghai.aliyuncs.com/header/2017-11-27_1511778896586',
            'saa');
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});



```
