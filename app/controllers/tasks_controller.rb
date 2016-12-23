class TasksController<ApplicationController

   def index

     if user_signed_in?
        @tasks=Task.where(:user_id=>current_user.id) 
        
        if Task.where(:user_id=>current_user.id).last.nil?    	
        	 @task_text='TasK'+(Task.where(:user_id=>current_user.id).count+1).to_s
    	    task=Task.new
    	    task.task_text=@task_text
    	    task.user_id=current_user.id
    	    task.status=0
    	    task.save
    	     @task=Task.where(:user_id=>current_user.id).last
    	else
    		 @task=Task.where(:user_id=>current_user.id).last
    		 if @task.lists.count==0
          if @task.task_text.nil?
             @task_text='TasK'+(Task.where(:user_id=>current_user.id).last.id).to_s
           else
            @task_text=@task.task_text
          end
    		 	
    		 	 @task=Task.last
    		 else
         
    		 	  @task_text='TasK'+(Task.where(:user_id=>current_user.id).last.id+1).to_s
    		    task=Task.new
    		    task.task_text=@task_text
    		    task.user_id=current_user.id
    		    task.status=0
    		    task.save
    		    @task=Task.where(:user_id=>current_user.id).last
    		 end	    
        end

      else
        
        redirect_to new_user_registration_path

    end


   end

   def new
   	
   end

   def create


   	
   end

   def edit
   	  @task=Task.find(params[:id])
      respond_to do |formate|

        formate.js
       end 


   end

   def update
   	  @task=Task.find(params[:id])
      
      @task.update(:task_text=>params[:task][:task_text])
      respond_to do |formate|

        formate.js
       end 
      
   end

   def destroy

      @task=Task.find(params[:id])
      @task.destroy
      redirect_to :back
   	
   end



end
