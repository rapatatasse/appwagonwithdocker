class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all.order(:name)
 
    if params[:query].present?
     
      case params[:search][:search_by]
      when "name"
        @products = @products.where("name ILIKE ?", "%#{params[:query]}%")
      when "comment"
        @products = @products.where("comment ILIKE ?", "%#{params[:query]}%")
      when "price"
        @products = @products.where("price = ?", "#{params[:query].to_f}")
      when "user"
        @products = @products.joins(:user).where("users.email ILIKE ?", "%#{params[:query]}%")
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @users = User.all
  end

  # GET /products/1/edit
  def edit
    @users = User.all
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    
      if @product.update(product_params)
        redirect_to products_url, notice: "Product was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
    end
 

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #fonction qui ajoute 20% a tout les prix des produits
  def augmenter_prix
    @products = Product.all
=begin     
    @products.each do |product|
      product.price = (product.price * 1.2).round(2)
      product.save
    end 
=end
    #ou 
    Product.all.map do |product|
      product.update(price: (product.price * 1.2).round(2))
    end
    redirect_to products_url, notice: "Product was successfully updated."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :comment, :price, :user_id)
    end
end
