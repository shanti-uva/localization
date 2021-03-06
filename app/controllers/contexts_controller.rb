class ContextsController < AclController
  
    before_filter :find_message
    
  # GET /contexts
  # GET /contexts.json
  def index
    @contexts = Context.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contexts }
    end
  end

  # GET /contexts/1
  # GET /contexts/1.json
  def show
    @context = Context.find(params[:id])
    @message = Message.find(@context.message.id)
    @translations = @context.translations
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @context }
    end
  end

  # GET /contexts/new
  # GET /contexts/new.json
  def new
    @context = Context.new
    @documents = Document.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @context }
    end
  end

  # GET /contexts/1/edit
  def edit
    @context = Context.find(params[:id])
    @documents = Document.all
  end

  # POST /contexts
  # POST /contexts.json
  def create
    @context = Context.new(params[:context])

    respond_to do |format|
      if @context.save
        #format.html { redirect_to @context, :notice => 'Context was successfully created.' }
        format.html { redirect_to @context.message, :notice => 'Context was successfully created.' }
        format.json { render :json => @context, :status => :created, :location => @context }
      else
        format.html { render :action => "new" }
        format.json { render :json => @context.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contexts/1
  # PUT /contexts/1.json
  def update
    @context = Context.find(params[:id])
    respond_to do |format|
      if @context.update_attributes(params[:context])
        #format.html { redirect_to @context, :notice => 'Context was successfully updated.' }
        format.html { redirect_to @context.message, :notice => 'Context was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @context.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contexts/1
  # DELETE /contexts/1.json
  def destroy
    @context = Context.find(params[:id])
    @parent_message = @context.message
    @context.destroy

    respond_to do |format|
      #format.html { redirect_to contexts_url }
      format.html { redirect_to @parent_message}
      format.json { head :no_content }
    end
  end
  
  def find_message
       @message = Message.find(params[:message_id])
       
   end  
end
