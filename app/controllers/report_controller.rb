class ReportController < ApplicationController
    def show
         sql =  "SELECT params_json FROM state_transactions WHERE  logging_tag ='#{params[:id]}'"
        @results = ActiveRecord::Base.connection.exec_query(sql)
         @results.each do |row|
             @data = row['params_json']
         end
          render 'show'

    end

    
   
    def index
       @start_date = Time.now.strftime('%Y-%m-%d')
       @end_date = Time.now.strftime('%Y-%m-%d')
        @json_data = Array.new
        @created_at = []
        sql =  "SELECT * FROM state_transactions WHERE  params_json not like '%asr%' ORDER BY id DESC"
        @results = ActiveRecord::Base.connection.exec_query(sql)
        @results.each do |row|
           unless row["params_json"].nil?
           # p JSON.parse(row["params_json"])
               @json_data << JSON.parse(row["params_json"]) 
                if row['created_at'].blank?
                     @created_at << row['updated_at'].strftime('%y-%m-%d %H:%M:%S')
                else
                     @created_at << row['created_at'].strftime('%y-%m-%d %H:%M:%S')
                end
            end
        end

        @report = @json_data
    end

    def search
        @session_id = Array.new
        @json_data = Array.new
        @created_at = []
        @file_data = params[:form][:session_id_file]
        if @file_data.respond_to?(:read)
         @txt_session_id = @file_data.read
         
        elsif @file_data.respond_to?(:path)
            @txt_session_id = File.read(@file_data.path)
        else
         logger.error "Bad file_data: #{@file_data.class.name}: #{@file_data.inspect}"
        end
        

        if  @txt_session_id.present?
          #@session_id =  @txt_session_id.strip.split(",")
           sql =   "SELECT * FROM state_transactions WHERE  params_json not like '%asr%' AND (((DATE(created_at) between '#{params[:form][:start_date]}' AND '#{params[:form][:end_date]}') or (DATE(updated_at) between '#{params[:form][:start_date]}'  AND '#{params[:form][:end_date]}'))) AND logging_tag in (#{@txt_session_id}) ORDER BY id DESC"
        else
            sql =   "SELECT * FROM state_transactions WHERE  params_json not like '%asr%' AND ((DATE(created_at) between '#{params[:form][:start_date]}' AND '#{params[:form][:end_date]}') or (DATE(updated_at) between '#{params[:form][:start_date]}'  AND '#{params[:form][:end_date]}')) ORDER BY id DESC"
        end

       
        @results = ActiveRecord::Base.connection.exec_query(sql)
        @results.each do |row|
                 unless row["params_json"].nil?
                     @json_data << JSON.parse(row["params_json"])
                        if row['created_at'].blank?
                         @created_at << row['updated_at'].strftime('%y-%m-%d %H:%M:%S')
                        else
                         @created_at << row['created_at'].strftime('%y-%m-%d %H:%M:%S')
                        end
                end
            end
        @start_date = params[:form][:start_date]
        @end_date   =  params[:form][:end_date]
        @report = @json_data 
        render 'index'

    end

    # def export_report
    #      sql =  "SELECT * FROM state_transactions WHERE  params_json not like '%asr%' ORDER BY id DESC"
    #     @results = ActiveRecord::Base.connection.exec_query(sql)
    #     CSV.generate do |csv|
    #         @results.each do |row|
    #             JSON.parse(row["params_json"]).each do |hash|
    #             csv << hash.values
    #             end
    #         end
    #     end

    #     render'index'
    # end

   
end
