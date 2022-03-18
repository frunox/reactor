defmodule Reactor.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Reactor.Content` context.
  """

  @doc """
  Generate a unique podcast title.
  """
  def unique_podcast_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a podcast.
  """
  def podcast_fixture(attrs \\ %{}) do
    {:ok, podcast} =
      attrs
      |> Enum.into(%{
        audio_url: "some audio_url",
        is_published: true,
        notes_html: "some notes_html",
        notes_md: "some notes_md",
        subtitle: "some subtitle",
        title: unique_podcast_title()
      })
      |> Reactor.Content.create_podcast()

    podcast
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        html: "some html",
        is_flagged: true,
        is_published: true,
        markdown: "some markdown"
      })
      |> Reactor.Content.create_comment()

    comment
  end

  @doc """
  Generate a unique topic name.
  """
  def unique_topic_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        name: unique_topic_name()
      })
      |> Reactor.Content.create_topic()

    topic
  end

  @doc """
  Generate a podcast_topic.
  """
  def podcast_topic_fixture(attrs \\ %{}) do
    {:ok, podcast_topic} =
      attrs
      |> Enum.into(%{

      })
      |> Reactor.Content.create_podcast_topic()

    podcast_topic
  end
end
