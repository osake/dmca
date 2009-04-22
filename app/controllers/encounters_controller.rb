class EncountersController < ApplicationController
  # GET /encounters
  # GET /encounters.xml
  def index
    @encounters = Encounter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @encounters }
    end
  end

  # GET /encounters/1
  # GET /encounters/1.xml
  def show
    @encounter = Encounter.find(params[:id])
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=", session["Test"]
    @encounter.actors.each {|a| a.current_health = session["#{a.name}"] || a.health }

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @encounter }
    end
  end

  # GET /encounters/new
  # GET /encounters/new.xml
  def new
    @encounter = Encounter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @encounter }
    end
  end

  # GET /encounters/1/edit
  def edit
    @encounter = Encounter.find(params[:id])
    @actors = Actor.find(:all, :conditions => ['encounter_id != ? OR encounter_id is NULL', @encounter.id])
  end
  
  # POST /encounters
  # POST /encounters.xml
  def create
    @encounter = Encounter.new(params[:encounter])

    respond_to do |format|
      if @encounter.save
        flash[:notice] = 'Encounter was successfully created.'
        format.html { redirect_to(@encounter) }
        format.xml  { render :xml => @encounter, :status => :created, :location => @encounter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @encounter.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def reset
    encounter = Encounter.find(params[:id])
    encounter.actors.each {|a| a.update_attribute(:initiative, 0)}
    reset_session
    redirect_to :back
  end
  
  def set_actor_current_health
    actor = Actor.find(params[:id])
    actor.current_health = params[:value]
    session["#{actor.name}"] = params[:value]
    render :text => actor.current_health
  end

  def set_actor_initiative
    actor = Actor.find(params[:id])
    actor.update_attribute(:initiative, params[:value])
    render :text => actor.initiative
  end

  # PUT /encounters/1
  # PUT /encounters/1.xml
  def update
    @encounter = Encounter.find(params[:id])
    @actors = []
    params.each do |k, v|
      @actors << Actor.find(params[k]) if k =~ /^add_actor_\d/
      if k =~ /^remove_actor_\d/
        actor = Actor.find(params[k])
        actor.encounter = nil
        actor.save!
      end
    end
    @encounter.actors << @actors

    respond_to do |format|
      if @encounter.update_attributes(params[:encounter])
        flash[:notice] = 'Encounter was successfully updated.'
        format.html { redirect_to(@encounter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @encounter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.xml
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to(encounters_url) }
      format.xml  { head :ok }
    end
  end
end
