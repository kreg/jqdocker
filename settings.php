<?php

$config['env'] = 'development';
$config['site_title'] = "Trip'n Scan";

// for All batch
$config['cron_exec_stop_file'] = FCPATH . 'batch_logs/cron_stop.log';
$config['cron_limit_stop_file'] = FCPATH . 'batch_logs/cron_stop_limit.log';

// for Logger
$config['logger_output_dir_master_batch'] = FCPATH . 'batch_logs/master/';
$config['logger_output_dir_translation_batch'] = FCPATH . 'batch_logs/translation/';
$config['logger_output_dir_api_for_batch'] = FCPATH . 'api_logs/batch/';

// WebView Server-Side
$config['enabled_fluentd'] = true;
$config['fluentd_host'] = 'localhost';
$config['fluentd_port'] = '24224';

// api_batch --------------------------------------------
$config['api_batch_json_dir'] = FCPATH . 'post_data/';

// マスタ更新時追加フィールド
$config['master_add_fields'] = array(
    'places' => array(
        'lang_cd' => 'ja',
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'projects' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'menu_categories' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'menu_items' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'shop_items' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'hotel_categories' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'hotel_simple_guides' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
    'generals' => array(
        'master_flag' => true,
        'translation_to' => 'en,zh-CN,zh-TW,ko',
        'translation_from' => null,
        'delete_flag' => false,
    ),
);

// 翻訳データ更新時追加フィールド
$config['translation_add_fields'] = array(
    'places' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'projects' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'menu_categories' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'menu_items' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'shop_items' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'hotel_categories' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'hotel_simple_guides' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
    'generals' => array(
        'master_flag' => false,
        'translation_to' => null,
        'delete_flag' => false,
    ),
);

// uuidフィールド
$config['uuid_fields'] = array(
    'places' => 'place_cd',
    'projects' => 'project_cd',
    'menu_categories' => 'menu_category_cd',
    'menu_items' => 'menu_item_cd',
    'hotel_categories' => 'hotel_category_cd',
    'hotel_simple_guides' => 'hotel_simple_guide_cd',
    'shop_items' => 'shop_item_cd',
    'generals' => 'general_cd',
);

// 親テーブル結合（projectsの子孫テーブル用）
$config['parent_join'] = array(
    'menu_categories' => array(
        'table' => 'projects',               // 親テーブル名
        'parent_id' => 'project_id',         // 親テーブルのidを格納するフィールド（親テーブルのid確定後にセット）
        'parent_temp_uuid' => 'project_cd',  // parent_id確定後にひも付けるまで必要（実際の子テーブルにはない）
    ),
    'menu_items' => array(
        'table' => 'menu_categories',
        'parent_id' => 'menu_category_id',
        'parent_temp_uuid' => 'menu_category_cd',
    ),
    'shop_items' => array(
        'table' => 'projects',
        'parent_id' => 'project_id',
        'parent_temp_uuid' => 'project_cd',
    ),
    'hotel_categories' => array(
        'table' => 'projects',               // 親テーブル名
        'parent_id' => 'project_id',         // 親テーブルのidを格納するフィールド（親テーブルのid確定後にセット）
        'parent_temp_uuid' => 'project_cd',  // parent_id確定後にひも付けるまで必要（実際の子テーブルにはない）
    ),
    'hotel_simple_guides' => array(
        'table' => 'hotel_categories',
        'parent_id' => 'hotel_category_id',
        'parent_temp_uuid' => 'hotel_category_cd',
    ),
    'generals' => array(
        'table' => 'projects',
        'parent_id' => 'project_id',
        'parent_temp_uuid' => 'project_cd',
    ),
);

// 自己結合（projectsの子孫テーブル用）
$config['self_join'] = array(
    'menu_categories' => array(
        'self_id' => 'menu_category_id',           // 自己結合に使うフィールド（一旦id確定後にセット）
        'self_temp_uuid' => 'menu_category_cd',    // self_id確定後にひも付けるまで必要（実際のテーブルにはない）
    ),
    'hotel_categories' => array(
        'self_id' => 'hotel_category_id',
        'self_temp_uuid' => 'hotel_category_cd',
    ),
);

// 翻訳対象フィールド
$config['translation_fields'] = array(
    'places' => array(
        'name',
	'name_ruby',
        'address_1',
        'address_2',
        'address_3',
        'address_4',
        'address_1_ruby',
        'address_2_ruby',
        'address_3_ruby',
        'address_4_ruby',
        'description',
        'additional_charge',
    ),
    'projects' => array(
        'name',
        'description',
    ),
    'menu_categories' => array(
        'name',
        'description',
    ),
    'menu_items' => array(
        'name',
        'description',
    ),
    'shop_items' => array(
        'name',
        'description',
        'category_name',
        'sub_category_name',
    ),
    'hotel_categories' => array(
        'name',
        'description',
    ),
    'hotel_simple_guides' => array(
        'caption',
        'contact',
        'location',
        'description',
    ),
    'generals' => array(
        'body',
    ),
);

$config['translation_fields_required'] = array(
    'places' => array(
        'name',
    ),
    'projects' => array(
        'name',
    ),
    'menu_categories' => array(
        'name',
    ),
    'menu_items' => array(
        'name',
    ),
    'shop_items' => array(
        'name',
    ),
    'hotel_categories' => array(
        'name',
    ),
    'hotel_simple_guides' => array(
        'caption',
    ),
    'generals' => array(
        'body',
    ),
);

// Batch API (for Master/Translation batch)
$config['batch_api_base_url'] = 'http://ec2-52-68-215-247.ap-northeast-1.compute.amazonaws.com/api_batch/';
$config['batch_api_send_push_master_uri'] = 'push_master/';
$config['batch_api_send_push_delete_master_uri'] = 'push_delete_master/';
$config['places_translation_queue_file'] = FCPATH . 'batch_logs/places_translation_queue.log';
$config['projects_translation_queue_file'] = FCPATH . 'batch_logs/projects_translation_queue.log';

// for Master batch
$config['master_api_base_url'] = 'https://52.88.127.40:8443/api/';
$config['master_api_bearer_token'] = '4668e122-ed18-4447-af17-5900c02862f9:uq2ibsc7bzkhofia';
$config['master_api_get_place_cds_uri'] = 'place/get_code';
$config['master_api_get_place_details_uri'] = 'place/get_detail';
$config['master_api_get_deleted_place_cds_uri'] = 'place/get_deleted_code';
$config['master_api_get_project_cds_uri'] = 'project/get_code';
$config['master_api_get_project_details_uri'] = 'project/get_detail';
$config['master_api_get_deleted_project_cds_uri'] = 'project/get_deleted_code';
$config['master_api_send_notify_readiness_uri'] = 'project/notify_readiness';
$config['master_api_places_last_updated_file'] = FCPATH . 'batch_logs/places_master_last_updated.log';
$config['master_api_places_last_deleted_file'] = FCPATH . 'batch_logs/places_master_last_deleted.log';
$config['master_api_projects_last_updated_file'] = FCPATH . 'batch_logs/projects_master_last_updated.log';
$config['master_api_projects_last_deleted_file'] = FCPATH . 'batch_logs/projects_master_last_deleted.log';
$config['no_places_file'] = FCPATH . 'batch_logs/no_places.log';
$config['no_projects_file'] = FCPATH . 'batch_logs/no_projects.log';
$config['no_data_uri'] = 'batch_logs/no_data/';

// for Translation batch

$config['translation_table_group'] = array("places", "projects");
$config['translation_running_flg_file'] = FCPATH . 'batch_logs/run_flg_[[table_group]].log';
$config['translation_log_dir'] = FCPATH . 'batch_logs/translation/';
$config['translation_api_key'] = '23840531ec5ffa33b145efe4bafa15e5057e158f0';
$config['translation_api_secret'] = 'b143030aca5585c724d10414eb9328b4';
$config['translation_master_api_url'] = 'http://ec2-52-68-215-247.ap-northeast-1.compute.amazonaws.com/api_batch/get_translation_master/';
$config['translation_send_api_url'] = 'http://ec2-52-68-215-247.ap-northeast-1.compute.amazonaws.com/api_batch/push_translation/';
$config['translation_api_urls'] = array(
  'ja__en' => 'https://monkeybreadtree.com/api/mt/general_ja_en/',
  'ja__ko' => 'https://monkeybreadtree.com/api/mt/general_ja_ko/',
  'ja__zh-CN' => 'https://monkeybreadtree.com/api/mt/general_ja_zh-CN/',
  'ja__zh-TW' => 'https://monkeybreadtree.com/api/mt/general_ja_zh-TW/',
);
$config['translation_exclude_fields'] = array(
  'table',
  'id',
  'lang_cd',
  'translation_to',
  'children'
);
$config['translation_api_errors'] = array(
  '500' => "API key Error",
  '501' => "name Error",
  '502' => "Request limitation (10000 times/day)",
  '510' => "OAuth Certification Error",
  '511' => "OAuth Header Error",
  '520' => "Access URL error",
  '521' => "Access URL error",
  '522' => "Request key error",
  '523' => "Request name error",
  '524' => "Request Parameter error",
  '530' => "Automatic translation authority error",
  '531' => "Automatic translation excution error",
);
$config['translation_api_name'] = 'jaqooldev';


// slack notification
$config['slack_api_url'] = 'https://slack.com/api/chat.postMessage';
$config['slack_api_token'] = '';    //-> https://api.slack.com/custom-integrations/legacy-tokens

$config['slack_batch_stopped_channel'] = '';
$config['slack_batch_stopped_username'] = '';
$config['slack_batch_stopeed_msg'] = '';

$config['s3_image_url'] = array(
    'development' => "http://img.dev.tripnscan.com/",
    'stage' => "http://img.stg.tripnscan.com/",
    'production' => "http://img.tripnscan.com/",
);

$config['s3_image_packet'] = array(
    'development' => "dev.tripnscan-img",
    'stage' => "stg.tripnscan-img",
    'production' => "prd.tripnscan-img",
);

$config['s3_access_key']  = 'AKIAJQUG2VAEWKW2RLGQ';
$config['s3_secret_key']  = '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';
$config['s3_region']      = 'ap-northeast-1';

//Translation mode
$config['translation_mbt_mode'] = false;
