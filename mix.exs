defmodule ExTermbox.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_termbox_ok,
      version: "1.0.3",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make | Mix.compilers()],
      make_targets: ["all"],
      make_clean: ["clean"],
      deps: deps(),
      description: description(),
      package: package(),
      aliases: aliases(),

      # Docs
      name: "ExTermboxOk",
      source_url: "https://github.com/okaram/ex_termbox_ok",
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.9", runtime: false},
      {:ex_doc, "~> 0.38", only: :dev, runtime: false},
      {:dialyze, "~> 0.2.0", only: :dev},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    "Termbox bindings for Elixir (fixex by Orlando Karam, June 2025)"
  end

  defp package do
    [
      files: ~w(
        c_src/termbox_bindings.c
        c_src/termbox/src/*.{inl,c,h}
        c_src/termbox/**/wscript
        c_src/termbox/waf
        lib
        priv/.keep
        Makefile
        mix.exs
        README.md
        LICENSE
      ),
      maintainers: ["Orlando Karam, (created by  Nick Reynolds)"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/okaram/ex_termbox_ok"}
    ]
  end

  defp aliases do
    [
      test: "test --exclude integration",
      "test.integration": "test --only integration"
    ]
  end
end
