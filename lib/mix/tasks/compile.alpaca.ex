defmodule Mix.Tasks.Compile.Alpaca do
  use Mix.Task

  @recursive true
  @manifest ".compile.alpaca"

  @moduledoc """
  Compiles Alpaca source files.
 
  """

  @doc """
  Runs this task.
  """
  def run(args) do
    project      = Mix.Project.config
    source_paths = Enum.map(Mix.Project.deps_paths, 
                            fn p -> 
                              elem(p, 1) 
                              |> Path.join("/src") 
                            end) ++ ["src"]

    files = Mix.Utils.extract_files(source_paths, [:alp])    
    do_run(files, project, source_paths)
  end

  defp do_run([], _, _), do: :noop
  defp do_run(files, project, source_paths) do
    IO.puts("== Compiling #{length(files)} Alpaca source files")
    case :alpaca.compile({:files, files}) do
      {:ok, compiled} ->
        for {:compiled_module, name, filename, bin} <- compiled do
          File.write!(Path.join(Mix.Project.compile_path, filename), bin)
        end
        IO.puts("== Alpaca files successfully compiled")
      {:error, _} = err ->
        try do
          fmt_error = :alpaca_error_format.fmt(err, "en_US")
          IO.write(:stderr, "Error compiling Alpaca source: #{fmt_error}\n")
        rescue
          _ -> IO.write(:stderr, "Unknown error compiling Alpaca source: #{inspect err}\n")
        end
        
        raise "Failed to compile Alpaca source files"
    end
  end

  @doc """
  Returns Erlang manifests.
  """
  def manifests, do: [manifest()]
  defp manifest, do: Path.join(Mix.Project.manifest_path, @manifest)

  @doc """
  Cleans up compilation artifacts.
  """
  def clean do
  end
end