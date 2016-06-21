use Timex
defmodule Cloudex.CloudinaryApi.Test do
  @moduledoc """
  A simple stub of cloudinary api responses to speed up testing
  """

  alias Cloudex.UploadedImage
  @behaviour Cloudex.CloudinaryApi

  @doc """
  Helper function to enable piping of {:ok, path} tuples into upload
  """
  def upload({:ok, item}) when is_binary(item) do
    upload(item)
  end


  @doc """
  Upload a file or url, returns a mocked static response
  """
  def upload(item) when is_binary(item) do
    return_fake_response
  end

  @doc """
  Catches upload called without a string argument
  """
  def upload(invalid_item) do
    {:error, "Upload/1 only accepts a String or {:ok, String}, received : #{inspect invalid_item}"}
  end

  defp return_fake_response do
    {:ok, date} = Timex.DateTime.local |> Timex.format("{ISO}")
    {:ok, %UploadedImage{
      bytes: 22659,
      created_at: date,
      etag: "dbb5764565c1b77ff049d20fcfd1d41d",
      format: "jpg",
      height: 167,
      original_filename: "test",
      public_id: "i2nruesgu4om3w9mtk1z",
      resource_type: "image",
      secure_url: "https://d1vibqt9pdnk2f.cloudfront.net/image/upload/v1448618543/i2nruesgu4om3w9mtk1z.jpg",
      signature: "77b447746476c82bb4921fdea62a9227c584974b",
      source: "test.jpg",
      tags: [],
      type: "upload",
      url: "http://images.cloudinary.com/test/image/upload/v1448618543/i2nruesgu4om3w9mtk1z.jpg",
      version: 1448618543,
      width: 250
    }}
  end
end
