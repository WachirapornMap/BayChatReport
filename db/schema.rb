# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_15_030132) do

  create_table "TRAN_MESSAGELOG", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CallUUID", limit: 50, null: false
    t.date "ActionDate"
    t.time "ActionTime"
    t.string "ChannelRQ_RS", limit: 2
    t.string "Message", limit: 8000
    t.datetime "SystemDT"
    t.string "Source", limit: 20
  end

  create_table "audits", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.string "result"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["result"], name: "index_audits_on_result"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "call_detail_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "duration", limit: 2
    t.string "language", limit: 10
    t.string "version", limit: 10
    t.string "ani", limit: 20
    t.string "dnis", limit: 20
    t.string "extension", limit: 40
    t.string "result", limit: 1
    t.string "name", limit: 100
    t.integer "menu_path_counter_id"
    t.string "last_dialog_name", limit: 100
    t.string "logging_tag", limit: 100
    t.string "last_dialog_result"
    t.integer "utterance_logs_count", default: 0, null: false
    t.integer "dialog_logs_count", default: 0, null: false
    t.boolean "garbage", default: false
    t.string "caller_code", limit: 20
    t.string "result_org", limit: 1
    t.string "garbage_reason", limit: 1
    t.integer "updated_by"
    t.datetime "updated_at"
    t.integer "editor_id"
    t.datetime "edited_at"
    t.string "session_code", limit: 40
    t.string "intent_tag", limit: 100
    t.string "destination", limit: 40
    t.boolean "rechecked"
    t.integer "rechecker_id"
    t.integer "recheck_result"
    t.string "telephony_result", limit: 1
    t.integer "self_service_success_count"
    t.string "site", limit: 50
    t.string "last_block_name"
    t.string "error_reason"
    t.integer "repeat_service"
    t.integer "repeat_service_count"
    t.text "journey"
    t.index ["ani"], name: "index_call_detail_logs_on_ani"
    t.index ["caller_code"], name: "index_call_detail_logs_on_caller_code"
    t.index ["destination"], name: "index_call_detail_logs_on_destination"
    t.index ["dnis"], name: "index_call_detail_logs_on_dnis"
    t.index ["edited_at"], name: "index_call_detail_logs_on_edited_at"
    t.index ["editor_id"], name: "index_call_detail_logs_on_editor_id"
    t.index ["garbage"], name: "index_call_detail_logs_on_garbage"
    t.index ["intent_tag"], name: "index_call_detail_logs_on_intent_tag"
    t.index ["last_dialog_name"], name: "index_call_detail_logs_on_last_dialog_name"
    t.index ["last_dialog_result"], name: "index_call_detail_logs_on_last_dialog_result"
    t.index ["logging_tag"], name: "index_call_detail_logs_on_logging_tag"
    t.index ["menu_path_counter_id"], name: "index_call_detail_logs_on_menu_path_counter_id"
    t.index ["result"], name: "index_call_detail_logs_on_result"
    t.index ["start_time"], name: "index_call_detail_logs_on_start_time"
  end

  create_table "call_intentions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "call_detail_log_id"
    t.integer "intention_id"
    t.datetime "start_time"
    t.string "logging_tag"
    t.datetime "deleted_at"
    t.string "product"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["call_detail_log_id"], name: "index_call_intentions_on_call_detail_log_id"
    t.index ["deleted_at"], name: "index_call_intentions_on_deleted_at"
    t.index ["intention_id"], name: "index_call_intentions_on_intention_id"
    t.index ["logging_tag"], name: "index_call_intentions_on_logging_tag"
    t.index ["product"], name: "index_call_intentions_on_product"
    t.index ["start_time"], name: "index_call_intentions_on_start_time"
  end

  create_table "caller_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caller_history_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "caller_code", limit: 20
    t.date "last_calling_date"
    t.string "pattern", limit: 4
    t.integer "rank", limit: 1
    t.integer "duration"
    t.integer "number_of_total"
    t.integer "number_of_success"
    t.integer "number_of_hangup"
    t.integer "number_of_exit"
    t.index ["caller_code"], name: "index_caller_history_logs_on_caller_code"
  end

  create_table "callers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "number", limit: 20
    t.string "customer_code", limit: 20
    t.string "customer_name", limit: 200
    t.integer "caller_category_id", limit: 1
    t.string "remarks", limit: 200
    t.index ["number"], name: "index_callers_on_number"
  end

  create_table "destinations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "destination_code", limit: 20
    t.string "display_name", limit: 50
    t.string "description", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dialog_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "duration", limit: 2
    t.string "dialog_name", limit: 100
    t.string "block_name", limit: 100
    t.integer "retry_count", limit: 1
    t.string "result", limit: 1
    t.string "last_input_method", limit: 10
    t.string "logging_tag", limit: 100
    t.bigint "call_detail_log_id"
    t.integer "utterance_logs_count", default: 0, null: false
    t.boolean "garbage", default: false
    t.integer "retry_confirmation_count", limit: 1
    t.string "result_org", limit: 1
    t.string "garbage_reason", limit: 1
    t.integer "updated_by"
    t.datetime "updated_at"
    t.integer "editor_id"
    t.datetime "edited_at"
    t.string "dialog_result"
    t.string "intention_result", limit: 1
    t.string "intention", limit: 50
    t.string "correct", limit: 1
    t.string "version"
    t.text "dialog_properties"
    t.index ["call_detail_log_id"], name: "index_dialog_logs_on_call_detail_log_id"
    t.index ["correct"], name: "index_dialog_logs_on_correct"
    t.index ["dialog_result"], name: "index_dialog_logs_on_dialog_result"
    t.index ["logging_tag"], name: "index_dialog_logs_on_logging_tag"
    t.index ["result"], name: "index_dialog_logs_on_result"
    t.index ["retry_count"], name: "index_dialog_logs_on_retry_count"
    t.index ["start_time"], name: "index_dialog_logs_on_start_time"
  end

  create_table "dropbox_files", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "path", limit: 250
    t.integer "bytes"
    t.datetime "client_mtime"
    t.integer "status", limit: 1
    t.index ["path"], name: "by_path", unique: true
  end

  create_table "edit_history_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.text "params_changed"
    t.integer "editable_history_logs_id"
    t.string "editable_history_logs_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["created_at"], name: "index_edit_history_logs_on_created_at"
    t.index ["editable_history_logs_id"], name: "index_edit_history_logs_on_editable_history_logs_id"
    t.index ["editable_history_logs_type"], name: "index_edit_history_logs_on_editable_history_logs_type"
    t.index ["updated_at"], name: "index_edit_history_logs_on_updated_at"
    t.index ["user_id"], name: "index_edit_history_logs_on_user_id"
  end

  create_table "import_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "duration_download"
    t.integer "duration_extraction"
    t.integer "result", limit: 1
    t.string "filename", limit: 250
    t.integer "file_size_bytes"
    t.datetime "file_modified"
    t.integer "audio_count"
    t.integer "dat_count"
    t.integer "call_detail_logs_count"
    t.integer "dialog_logs_count"
    t.integer "utterance_logs_count"
    t.integer "user_id"
    t.index ["filename"], name: "by_filename"
  end

  create_table "intention", primary_key: "Intention_tag", id: :string, limit: 31, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "Intention_code", null: false
    t.string "call_work_code", limit: 44
    t.string "description", limit: 73
  end

  create_table "intentions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "intention_code"
    t.string "intention_tag"
    t.string "description"
    t.string "category"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "utterance_log_id"
    t.string "name"
    t.string "hyp"
    t.string "ref"
    t.string "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["utterance_log_id"], name: "index_keywords_on_utterance_log_id"
  end

  create_table "menu_path_counters", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "menu_path", limit: 5000
    t.string "call_result", limit: 1
    t.string "version", limit: 10
    t.integer "total"
    t.float "average_duration"
    t.integer "number_of_dialogs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "controller_name"
    t.string "action_name"
    t.string "category"
    t.string "module_name"
    t.string "component"
    t.string "criteria"
    t.string "description"
    t.integer "sort_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "prompt_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "dialog_log_id"
    t.integer "call_detail_log_id"
    t.datetime "start_time"
    t.string "prompt_type", limit: 50
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_detail_log_id"], name: "index_prompt_logs_on_call_detail_log_id"
    t.index ["dialog_log_id"], name: "index_prompt_logs_on_dialog_log_id"
    t.index ["start_time"], name: "index_prompt_logs_on_start_time"
  end

  create_table "roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semantic", primary_key: "semantic_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "semantic_tag", limit: 71, null: false
    t.integer "intention_code", null: false
  end

  create_table "semantic_compounds", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "semantic_id", null: false
    t.string "main_action"
    t.string "sub_action"
    t.string "opt_1"
    t.string "subject"
    t.string "opt_2"
    t.string "more_info_1"
    t.string "opt_3"
    t.string "more_info_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semantics", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "semantic_tags"
    t.string "intention_tags"
    t.integer "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "audio_filename"
    t.boolean "confirm_with_product", default: true
    t.string "products"
    t.integer "intention_id"
    t.string "semantic_tags_en"
    t.index ["confirm_with_product"], name: "index_semantics_on_confirm_with_product"
    t.index ["intention_id"], name: "index_semantics_on_intention_id"
  end

  create_table "semantics_unique_utterances", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "semantic_id"
    t.integer "unique_utterance_id"
    t.index ["semantic_id"], name: "index_semantics_unique_utterances_on_semantic_id"
    t.index ["unique_utterance_id"], name: "index_semantics_unique_utterances_on_unique_utterance_id"
  end

  create_table "semi_norms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "unique_utterance_id"
    t.text "semi_norm_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "state_transactions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "logging_tag"
    t.string "ivr_key"
    t.text "params_json"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "timetag"
    t.integer "utterance_log_id"
    t.index ["created_at"], name: "index_state_transactions_on_created_at"
    t.index ["ivr_key"], name: "index_state_transactions_on_ivr_key"
    t.index ["logging_tag"], name: "index_state_transactions_on_logging_tag"
    t.index ["timetag"], name: "index_state_transactions_on_timetag"
    t.index ["updated_at"], name: "index_state_transactions_on_updated_at"
    t.index ["utterance_log_id"], name: "index_state_transactions_on_utterance_log_id"
  end

  create_table "taggings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["created_at"], name: "index_taggings_on_created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "task_log_details", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "task_log_id"
    t.integer "utterance_log_id"
    t.string "key"
    t.string "hyp"
    t.string "source"
    t.string "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["correct"], name: "index_task_log_details_on_correct"
    t.index ["created_at"], name: "index_task_log_details_on_created_at"
    t.index ["hyp"], name: "index_task_log_details_on_hyp"
    t.index ["key"], name: "index_task_log_details_on_key"
    t.index ["source"], name: "index_task_log_details_on_source"
    t.index ["task_log_id"], name: "index_task_log_details_on_task_log_id"
    t.index ["utterance_log_id"], name: "index_task_log_details_on_utterance_log_id"
  end

  create_table "task_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "call_detail_log_id"
    t.integer "dialog_log_id"
    t.string "logging_tag"
    t.string "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["call_detail_log_id"], name: "index_task_logs_on_call_detail_log_id"
    t.index ["complete"], name: "index_task_logs_on_complete"
    t.index ["created_at"], name: "index_task_logs_on_created_at"
    t.index ["dialog_log_id"], name: "index_task_logs_on_dialog_log_id"
    t.index ["logging_tag"], name: "index_task_logs_on_logging_tag"
  end

  create_table "transaction_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "call_detail_log_id"
    t.datetime "start_time"
    t.string "logging_tag"
    t.string "label"
    t.string "event_name"
    t.integer "index"
    t.string "result"
    t.string "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["call_detail_log_id"], name: "index_transaction_logs_on_call_detail_log_id"
    t.index ["contents"], name: "index_transaction_logs_on_contents"
    t.index ["event_name"], name: "index_transaction_logs_on_event_name"
    t.index ["index"], name: "index_transaction_logs_on_index"
    t.index ["label"], name: "index_transaction_logs_on_label"
    t.index ["logging_tag"], name: "index_transaction_logs_on_logging_tag"
    t.index ["result"], name: "index_transaction_logs_on_result"
    t.index ["start_time"], name: "index_transaction_logs_on_start_time"
  end

  create_table "transcription_task_assignments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "call_detail_log_id"
    t.integer "transcription_task_id"
  end

  create_table "transcription_tasks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "task_date"
    t.integer "assigned_editor_id"
    t.integer "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unique_utterances", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "normalized_ref"
    t.integer "frequency"
    t.integer "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "lock_version", default: 0
    t.datetime "picked_at", default: "1970-01-01 00:00:00"
    t.string "products"
    t.datetime "edited_at"
    t.boolean "incorrect_tag"
    t.boolean "reviewed"
    t.index ["edited_at"], name: "index_unique_utterances_on_edited_at"
    t.index ["incorrect_tag"], name: "index_unique_utterances_on_incorrect_tag"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "login", limit: 40
    t.string "display_name", limit: 100, default: ""
    t.string "email", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "remember_token", limit: 40
    t.datetime "remember_token_expires_at"
    t.datetime "deleted_at"
    t.string "password_digest", limit: 100
    t.boolean "admin"
    t.boolean "confirmed", default: false
    t.integer "role_id"
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "utterance_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "prompt_end_msec"
    t.integer "vad_start_msec"
    t.integer "vad_end_msec"
    t.integer "hyp_start_msec"
    t.integer "hyp_end_msec"
    t.string "result", limit: 1
    t.string "result2", limit: 1
    t.string "reason", limit: 1
    t.string "ref", limit: 500
    t.string "ref_tags", limit: 200
    t.string "hyp", limit: 600
    t.string "hyp_tags", limit: 200
    t.string "correct", limit: 1
    t.string "task_matched", limit: 1
    t.string "task_unmatch_reason", limit: 1
    t.integer "noise_level", limit: 1
    t.float "confidence"
    t.string "rule_name", limit: 50
    t.string "filename", limit: 150
    t.string "mode_name", limit: 100
    t.float "confidence_level"
    t.string "grammar", limit: 100
    t.string "speaker", limit: 100
    t.string "speaker_sex", limit: 1
    t.string "hostname", limit: 20
    t.string "logging_tag", limit: 100
    t.string "tokens", limit: 5000
    t.string "dialog_state", limit: 1
    t.bigint "initial_utterance_log_id"
    t.bigint "call_detail_log_id"
    t.bigint "dialog_log_id"
    t.string "comment", limit: 200
    t.string "grammar_filename", limit: 2000
    t.string "language", limit: 10
    t.integer "editor_id"
    t.integer "ref_start_msec"
    t.integer "ref_end_msec"
    t.string "input_mode", limit: 1
    t.integer "dialog_state_retry", limit: 1
    t.integer "snr"
    t.integer "voice_too_loud_count", limit: 1
    t.integer "result_count", limit: 1
    t.datetime "edited_at"
    t.integer "updated_by"
    t.datetime "updated_at"
    t.string "hyp_speaker_sex", limit: 1
    t.integer "signal_log_power"
    t.integer "noise_log_power"
    t.boolean "too_long"
    t.boolean "too_loud"
    t.string "semantic_engine_version", limit: 20
    t.integer "unique_utterance_id"
    t.integer "semi_norm_id"
    t.boolean "misspell"
    t.boolean "reviewed"
    t.string "hyp_tags_org"
    t.string "dialect"
    t.string "semantic_tag_correct"
    t.string "keyword_correct"
    t.string "product_tags"
    t.integer "correction"
    t.integer "insertion"
    t.integer "deletion"
    t.integer "substitution"
    t.float "word_accuracy"
    t.boolean "transcribe_incorrect"
    t.string "reject_reason", limit: 1
    t.index ["call_detail_log_id", "dialog_log_id"], name: "index_utterance_logs_on_call_detail_log_id_and_dialog_log_id"
    t.index ["call_detail_log_id"], name: "index_utterance_logs_on_call_detail_log_id"
    t.index ["dialect"], name: "index_utterance_logs_on_dialect"
    t.index ["dialog_log_id"], name: "index_utterance_logs_on_dialog_log_id"
    t.index ["edited_at"], name: "index_utterance_logs_on_edited_at"
    t.index ["editor_id"], name: "index_utterance_logs_on_editor_id"
    t.index ["filename"], name: "index_utterance_logs_on_filename"
    t.index ["hyp_tags"], name: "index_utterance_logs_on_hyp_tags"
    t.index ["logging_tag"], name: "index_utterance_logs_on_logging_tag"
    t.index ["product_tags"], name: "index_utterance_logs_on_product_tags"
    t.index ["ref_tags"], name: "index_utterance_logs_on_ref_tags"
    t.index ["result"], name: "index_utterance_logs_on_result"
    t.index ["semi_norm_id"], name: "index_utterance_logs_on_semi_norm_id"
    t.index ["start_time", "grammar"], name: "index_utterance_logs_on_start_time_and_grammar"
    t.index ["start_time"], name: "index_utterance_logs_on_start_time"
    t.index ["task_matched"], name: "index_utterance_logs_on_task_matched"
    t.index ["task_unmatch_reason"], name: "index_utterance_logs_on_task_unmatch_reason"
    t.index ["unique_utterance_id"], name: "index_utterance_logs_on_unique_utterance_id"
  end

  add_foreign_key "semantics", "intentions"
end
