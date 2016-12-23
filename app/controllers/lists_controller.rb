class ListsController<ApplicationController
    before_action :find_listable

   def index
   	
   end

   def new

     @list= List.new
   	
   end

   def create
      @renderdiv=''
    	@list = @listable.lists.new 
      @list_class=params[:list][:class]
      @list.list_text=params[:list][:list_text]
      if !params[:list][:task_id].nil?
         @list.listable_type='Task'
         @renderdiv='Task'
       



      else
         @list.listable_type='List'
         @renderdiv='List'
         @list=Task.find(params[:list][:list_id])
      end
      @list.status=params[:list][:status]
     if @list.save
          if !params[:list][:task_id].nil?
              @task=Task.find(params[:list][:task_id])
          if @task.lists.where(:status=>1).count==@task.lists.count

                @task.update(:status=>1)
                @status=1


             else
                @task.update(:status=>0)   
                @status=0         

          end  
         end
         @result=1
    else

          @result=0

    end
       
      respond_to do |format|

          format.js  

      end   

   end

   def edit
   	
   end

   def update
       @status=0
      if !params[:id].nil? && !params[:list][:list_text].nil?
        
              
        @list=List.find_by_id(params[:id])
        @list.update(:status=>params[:list][:status],:list_text=>params[:list][:list_text]);
          
        @task=Task.find(params[:task_id])
       
        if @task.lists.where(:status=>1).count==@task.lists.count

            @task.update(:status=>1)
            @status=1


         else
            @task.update(:status=>0)   
            @status=0         

        end
       else
          
       end 
        respond_to do |format|

          format.js  

      end

   	
   end

   def destroy
   	
   end

private

    def list_params
      params.require(:list).permit(:task_id,:list_text,:status,:list_class)
    end

    def find_listable
      
      @listable = List.find_by_id(params[:list][:list_id]) if params[:list][:list_id]
      @listable = Task.find_by_id(params[:list][:task_id]) if params[:list][:task_id]
    end


end
