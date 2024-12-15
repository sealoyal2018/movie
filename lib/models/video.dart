import 'package:flutter/material.dart';

class Video {
  int? vodId;
  int? typeId;
  int? typeId1;
  int? groupId;
  String? vodName;
  String? vodSub;
  String? vodEn;
  int? vodStatus;
  String? vodLetter;
  String? vodColor;
  String? vodTag;
  String? vodClass;
  String? vodPic;
  String? vodPicThumb;
  String? vodPicSlide;
  String? vodPicScreenshot;
  String? vodActor;
  String? vodDirector;
  String? vodWriter;
  String? vodBehind;
  String? vodBlurb;
  String? vodRemarks;
  String? vodPubdate;
  int? vodTotal;
  String? vodSerial;
  String? vodTv;
  String? vodWeekday;
  String? vodArea;
  String? vodLang;
  String? vodYear;
  String? vodVersion;
  String? vodState;
  String? vodAuthor;
  String? vodJumpurl;
  String? vodTpl;
  String? vodTplPlay;
  String? vodTplDown;
  int? vodIsend;
  int? vodLock;
  int? vodLevel;
  int? vodCopyright;
  int? vodPoints;
  int? vodPointsPlay;
  int? vodPointsDown;
  int? vodHits;
  int? vodHitsDay;
  int? vodHitsWeek;
  int? vodHitsMonth;
  String? vodDuration;
  int? vodUp;
  int? vodDown;
  String? vodScore;
  int? vodScoreAll;
  int? vodScoreNum;
  String? vodTime;
  int? vodTimeAdd;
  int? vodTimeHits;
  int? vodTimeMake;
  int? vodTrysee;
  int? vodDoubanId;
  String? vodDoubanScore;
  String? vodReurl;
  String? vodRelVod;
  String? vodRelArt;
  String? vodPwd;
  String? vodPwdUrl;
  String? vodPwdPlay;
  String? vodPwdPlayUrl;
  String? vodPwdDown;
  String? vodPwdDownUrl;
  String? vodContent;
  String? vodPlayFrom;
  String? vodPlayServer;
  String? vodPlayNote;
  String? vodPlayUrl;
  String? vodDownFrom;
  String? vodDownServer;
  String? vodDownNote;
  String? vodDownUrl;
  int? vodPlot;
  String? vodPlotName;
  String? vodPlotDetail;
  String? typeName;

  Video(
      {this.vodId,
      this.typeId,
      this.typeId1,
      this.groupId,
      this.vodName,
      this.vodSub,
      this.vodEn,
      this.vodStatus,
      this.vodLetter,
      this.vodColor,
      this.vodTag,
      this.vodClass,
      this.vodPic,
      this.vodPicThumb,
      this.vodPicSlide,
      this.vodPicScreenshot,
      this.vodActor,
      this.vodDirector,
      this.vodWriter,
      this.vodBehind,
      this.vodBlurb,
      this.vodRemarks,
      this.vodPubdate,
      this.vodTotal,
      this.vodSerial,
      this.vodTv,
      this.vodWeekday,
      this.vodArea,
      this.vodLang,
      this.vodYear,
      this.vodVersion,
      this.vodState,
      this.vodAuthor,
      this.vodJumpurl,
      this.vodTpl,
      this.vodTplPlay,
      this.vodTplDown,
      this.vodIsend,
      this.vodLock,
      this.vodLevel,
      this.vodCopyright,
      this.vodPoints,
      this.vodPointsPlay,
      this.vodPointsDown,
      this.vodHits,
      this.vodHitsDay,
      this.vodHitsWeek,
      this.vodHitsMonth,
      this.vodDuration,
      this.vodUp,
      this.vodDown,
      this.vodScore,
      this.vodScoreAll,
      this.vodScoreNum,
      this.vodTime,
      this.vodTimeAdd,
      this.vodTimeHits,
      this.vodTimeMake,
      this.vodTrysee,
      this.vodDoubanId,
      this.vodDoubanScore,
      this.vodReurl,
      this.vodRelVod,
      this.vodRelArt,
      this.vodPwd,
      this.vodPwdUrl,
      this.vodPwdPlay,
      this.vodPwdPlayUrl,
      this.vodPwdDown,
      this.vodPwdDownUrl,
      this.vodContent,
      this.vodPlayFrom,
      this.vodPlayServer,
      this.vodPlayNote,
      this.vodPlayUrl,
      this.vodDownFrom,
      this.vodDownServer,
      this.vodDownNote,
      this.vodDownUrl,
      this.vodPlot,
      this.vodPlotName,
      this.vodPlotDetail,
      this.typeName});

  String getPicUrl() {
    final domain = 'https://pic.youkupic.com/';
    if (vodPic != null && vodPic!.contains(domain)) {
      debugPrint("path0: $vodPic");
      var path = vodPic?.replaceAll('https://pic.huishij.com/', '');
      debugPrint("path2: $path");
      return path!;
    }
    debugPrint("vodPic: $vodPic");
    return vodPic!;
  }

  Video.fromJson(Map<String, dynamic> json) {
    vodId = json['vod_id'];
    typeId = json['type_id'];
    typeId1 = json['type_id_1'];
    groupId = json['group_id'];
    vodName = json['vod_name'];
    vodSub = json['vod_sub'];
    vodEn = json['vod_en'];
    vodStatus = json['vod_status'];
    vodLetter = json['vod_letter'];
    vodColor = json['vod_color'];
    vodTag = json['vod_tag'];
    vodClass = json['vod_class'];
    vodPic = json['vod_pic'];
    vodPicThumb = json['vod_pic_thumb'];
    vodPicSlide = json['vod_pic_slide'];
    vodPicScreenshot = json['vod_pic_screenshot'];
    vodActor = json['vod_actor'];
    vodDirector = json['vod_director'];
    vodWriter = json['vod_writer'];
    vodBehind = json['vod_behind'];
    vodBlurb = json['vod_blurb'];
    vodRemarks = json['vod_remarks'];
    vodPubdate = json['vod_pubdate'];
    vodTotal = json['vod_total'];
    vodSerial = json['vod_serial'];
    vodTv = json['vod_tv'];
    vodWeekday = json['vod_weekday'];
    vodArea = json['vod_area'];
    vodLang = json['vod_lang'];
    vodYear = json['vod_year'];
    vodVersion = json['vod_version'];
    vodState = json['vod_state'];
    vodAuthor = json['vod_author'];
    vodJumpurl = json['vod_jumpurl'];
    vodTpl = json['vod_tpl'];
    vodTplPlay = json['vod_tpl_play'];
    vodTplDown = json['vod_tpl_down'];
    vodIsend = json['vod_isend'];
    vodLock = json['vod_lock'];
    vodLevel = json['vod_level'];
    vodCopyright = json['vod_copyright'];
    vodPoints = json['vod_points'];
    vodPointsPlay = json['vod_points_play'];
    vodPointsDown = json['vod_points_down'];
    vodHits = json['vod_hits'];
    vodHitsDay = json['vod_hits_day'];
    vodHitsWeek = json['vod_hits_week'];
    vodHitsMonth = json['vod_hits_month'];
    vodDuration = json['vod_duration'];
    vodUp = json['vod_up'];
    vodDown = json['vod_down'];
    vodScore = json['vod_score'];
    vodScoreAll = json['vod_score_all'];
    vodScoreNum = json['vod_score_num'];
    vodTime = json['vod_time'];
    vodTimeAdd = json['vod_time_add'];
    vodTimeHits = json['vod_time_hits'];
    vodTimeMake = json['vod_time_make'];
    vodTrysee = json['vod_trysee'];
    vodDoubanId = json['vod_douban_id'];
    vodDoubanScore = json['vod_douban_score'];
    vodReurl = json['vod_reurl'];
    vodRelVod = json['vod_rel_vod'];
    vodRelArt = json['vod_rel_art'];
    vodPwd = json['vod_pwd'];
    vodPwdUrl = json['vod_pwd_url'];
    vodPwdPlay = json['vod_pwd_play'];
    vodPwdPlayUrl = json['vod_pwd_play_url'];
    vodPwdDown = json['vod_pwd_down'];
    vodPwdDownUrl = json['vod_pwd_down_url'];
    vodContent = json['vod_content'];
    vodPlayFrom = json['vod_play_from'];
    vodPlayServer = json['vod_play_server'];
    vodPlayNote = json['vod_play_note'];
    vodPlayUrl = json['vod_play_url'];
    vodDownFrom = json['vod_down_from'];
    vodDownServer = json['vod_down_server'];
    vodDownNote = json['vod_down_note'];
    vodDownUrl = json['vod_down_url'];
    vodPlot = json['vod_plot'];
    vodPlotName = json['vod_plot_name'];
    vodPlotDetail = json['vod_plot_detail'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vod_id'] = vodId;
    data['type_id'] = typeId;
    data['type_id_1'] = typeId1;
    data['group_id'] = groupId;
    data['vod_name'] = vodName;
    data['vod_sub'] = vodSub;
    data['vod_en'] = vodEn;
    data['vod_status'] = vodStatus;
    data['vod_letter'] = vodLetter;
    data['vod_color'] = vodColor;
    data['vod_tag'] = vodTag;
    data['vod_class'] = vodClass;
    data['vod_pic'] = vodPic;
    data['vod_pic_thumb'] = vodPicThumb;
    data['vod_pic_slide'] = vodPicSlide;
    data['vod_pic_screenshot'] = vodPicScreenshot;
    data['vod_actor'] = vodActor;
    data['vod_director'] = vodDirector;
    data['vod_writer'] = vodWriter;
    data['vod_behind'] = vodBehind;
    data['vod_blurb'] = vodBlurb;
    data['vod_remarks'] = vodRemarks;
    data['vod_pubdate'] = vodPubdate;
    data['vod_total'] = vodTotal;
    data['vod_serial'] = vodSerial;
    data['vod_tv'] = vodTv;
    data['vod_weekday'] = vodWeekday;
    data['vod_area'] = vodArea;
    data['vod_lang'] = vodLang;
    data['vod_year'] = vodYear;
    data['vod_version'] = vodVersion;
    data['vod_state'] = vodState;
    data['vod_author'] = vodAuthor;
    data['vod_jumpurl'] = vodJumpurl;
    data['vod_tpl'] = vodTpl;
    data['vod_tpl_play'] = vodTplPlay;
    data['vod_tpl_down'] = vodTplDown;
    data['vod_isend'] = vodIsend;
    data['vod_lock'] = vodLock;
    data['vod_level'] = vodLevel;
    data['vod_copyright'] = vodCopyright;
    data['vod_points'] = vodPoints;
    data['vod_points_play'] = vodPointsPlay;
    data['vod_points_down'] = vodPointsDown;
    data['vod_hits'] = vodHits;
    data['vod_hits_day'] = vodHitsDay;
    data['vod_hits_week'] = vodHitsWeek;
    data['vod_hits_month'] = vodHitsMonth;
    data['vod_duration'] = vodDuration;
    data['vod_up'] = vodUp;
    data['vod_down'] = vodDown;
    data['vod_score'] = vodScore;
    data['vod_score_all'] = vodScoreAll;
    data['vod_score_num'] = vodScoreNum;
    data['vod_time'] = vodTime;
    data['vod_time_add'] = vodTimeAdd;
    data['vod_time_hits'] = vodTimeHits;
    data['vod_time_make'] = vodTimeMake;
    data['vod_trysee'] = vodTrysee;
    data['vod_douban_id'] = vodDoubanId;
    data['vod_douban_score'] = vodDoubanScore;
    data['vod_reurl'] = vodReurl;
    data['vod_rel_vod'] = vodRelVod;
    data['vod_rel_art'] = vodRelArt;
    data['vod_pwd'] = vodPwd;
    data['vod_pwd_url'] = vodPwdUrl;
    data['vod_pwd_play'] = vodPwdPlay;
    data['vod_pwd_play_url'] = vodPwdPlayUrl;
    data['vod_pwd_down'] = vodPwdDown;
    data['vod_pwd_down_url'] = vodPwdDownUrl;
    data['vod_content'] = vodContent;
    data['vod_play_from'] = vodPlayFrom;
    data['vod_play_server'] = vodPlayServer;
    data['vod_play_note'] = vodPlayNote;
    data['vod_play_url'] = vodPlayUrl;
    data['vod_down_from'] = vodDownFrom;
    data['vod_down_server'] = vodDownServer;
    data['vod_down_note'] = vodDownNote;
    data['vod_down_url'] = vodDownUrl;
    data['vod_plot'] = vodPlot;
    data['vod_plot_name'] = vodPlotName;
    data['vod_plot_detail'] = vodPlotDetail;
    data['type_name'] = typeName;
    return data;
  }
}
