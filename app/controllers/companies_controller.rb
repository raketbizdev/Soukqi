class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]
  before_action :authorize_company_owner, only: %i[edit update destroy]
layout "inner_app"
  # GET /companies
  def index
    @companies = current_user.companies
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = current_user.companies.build
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = current_user.companies.build(company_params)

    if @company.save
      redirect_to @company, notice: "Company was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice: "Company was successfully destroyed."
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def authorize_company_owner
    redirect_to companies_path, alert: "You are not authorized to perform this action." unless @company.user == current_user
  end

  def company_params
    params.require(:company).permit(:name, :description, :address, :city, :state, :zip, :country, :phone, :website)
  end
end
