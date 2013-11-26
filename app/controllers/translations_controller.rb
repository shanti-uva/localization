class TranslationsController  < AclController
  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @translations }
    end
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    @message = Message.find(params[:message_id])
    @context = Context.find(params[:context_id])
    @translation = Translation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @translation }
    end
  end

  # GET /translations/new
  # GET /translations/new.json
  def new
    @message = Message.find(params[:message_id])
    @context = Context.find(params[:context_id])
    
    @languages = ComplexScripts::Language.all
    
    @translation = Translation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @translation }
    end
  end

  # GET /translations/1/edit
  def edit
    @message = Message.find(params[:message_id])
    @context = Context.find(params[:context_id])
    
    @languages = ComplexScripts::Language.all
    
    @translation = Translation.find(params[:id])
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = Translation.new(params[:translation])
    
    respond_to do |format|
      if @translation.save
        #format.html { redirect_to @translation, :notice => 'Translation was successfully created.' }
        format.html { redirect_to @translation.context, :notice => 'Translation was successfully updated.' }
        format.json { render :json => @translation, :status => :created, :location => @translation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /translations/1
  # PUT /translations/1.json
  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        #format.html { redirect_to @translation, :notice => 'Translation was successfully updated.' }
        format.html { redirect_to @translation.context, :notice => 'Translation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation = Translation.find(params[:id])
    @parent_context = @translation.context
    #@parent_message = @parent_context.message
    @translation.destroy

    respond_to do |format|
      #format.html { redirect_to translations_url }
      format.html { redirect_to @parent_context}
      format.json { head :no_content }
    end
  end
end
