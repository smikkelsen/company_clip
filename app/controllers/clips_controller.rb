class ClipsController < ApplicationController

  before_filter :get_ip

  # GET /clips
  # GET /clips.json
  def index
    @clips = Clip.find_by_ip_id(@ip.id)
  end

  # GET /clips/1
  # GET /clips/1.json
  def show
    @clip = Clip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clip }
    end
  end

  # GET /clips/new
  # GET /clips/new.json
  def new
    @clip = Clip.new

    respond_to do |format|
      format.ajax # new.html.erb
      format.json { render json: @clip }
    end
  end

  # GET /parents/1/children/new (AJAX)
  def new
    parent = Parent.find(params[:parent_id])
    @child = parent.children.create
    new_child_form = render_to_string :layout => false
    new_child_form.gsub!("[#{@child.id}]", "[#{Time.now.to_i}]")
    render :text => new_child_form, :layout => false
  end

  # GET /clips/1/edit
  def edit
    @clip = Clip.find(params[:id])
  end

  # POST /clips
  # POST /clips.json
  def create
    @clip = Clip.new(params[:clip])

    respond_to do |format|
      if @clip.save
        format.html { redirect_to @clip, notice: 'Clip was successfully created.' }
        format.json { render json: @clip, status: :created, location: @clip }
      else
        format.html { render action: "new" }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clips/1
  # PUT /clips/1.json
  def update
    @clip = Clip.find(params[:id])

    respond_to do |format|
      if @clip.update_attributes(params[:clip])
        format.html { redirect_to @clip, notice: 'Clip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clips/1
  # DELETE /clips/1.json
  def destroy
    @clip = Clip.find(params[:id])
    @clip.destroy

    respond_to do |format|
      format.html { redirect_to clips_url }
      format.json { head :no_content }
    end
  end
end

private

def get_ip
  ip = request.remote_ip
  @ip = Ip.find_by_ip(ip)
  if @ip.nil?
    @ip = Ip.new(:address => ip)
    @ip.save!
  end
end