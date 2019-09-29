# ScriptdropCodeSample

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Feedback

> **Note:**
>
> I limit all coding challenges to a mixumum of 8 hours of work done for free.
>
> Not all tasks given in the prompt were completed in time, but I've included a writeup of
> how I expect to have finished those sections.

This was the first time I've ever tried to use Elixir or Phoenix. I initially struggled
for a quite a while trying to understand the Ecto modeling system and how I was supposed
to do custom validations, error correcting, formatting (ie phone numbers) and also how to
mock said systems. I probably spent most of my time just understanding Ecto.

## Signing in as a User

Turns out all the current plugins for authentication are out-of-date and can't be used in
a phoenix project on latest versions. So I couldn't use `addict` or `access_pass` and
writing my own user/pass system would have meant not achieving probably any of the goals
of the assessment. So I opted to just have the evaluator click a button to assume the
identity of that account. This didn't get finished though as I was trying to figure out
where the boundary of elixir/phoenix tasks and JS was.

## CRUD for Orders, Pharmacies, Patients

This is all done and working, but not the way I wanted to do it. I wanted, when making an
Order, to be able to use a select box to choose the Patient and Pharmacy the Order was
for, but I kept running into a type error when using phoenix_html and no matter how many
times I turned the list of models into a list of objects/named-lists, it just kept giving
me that same error about not being safe to render a struct. This was very frustrating, but
I chalk it up to inexperience and lack of examples.

## Seeding Data

Considering how often you have to delete the DB and re-create when making an Ecto model,
learning how to seed data was a god-send. Too bad the docs never mention it anywhere. The
`seed.exs` file was such a boon to my productivity after I figured out it existed and now
to use it. The docs never say how to create a model instance, you're just supposed to
figure out that the `iex` output is the same as a creator.

## Lack of a Debugger

While the cli output is decent once you figure it out and understand what it's telling
you, the lack of a real debugger was a big detractor since I, as a newbie, wasn't able to
tell why my code paths weren't being run sometimes.

## Unit Tests Failing

Once I started adding relationships to my models, my units tests were irreparably ruined.
`assert` didn't understand that a `nil` and an empty/unloaded association were truthy, and
I couldn't figure out how to add the associations to my mocks.

## Less like Rails than Expected

I came into phoenix expecting it to be a lot more like rails than it was. That may be due
to maturity/age, but Rails is much friendlier to the uninitiated.

# Your Specific Questions

## What was the hardest part of the implementation?

Ecto. Hands down. The Ecto docs are the perfect example of seemingly helpful at a glance,
but actually useless in practice. Beyond the `field` fucntion, the Ecto docs expect you to
have a full understanding of the language and Ecto itself already.

## What would be your next couple of tasks if you had more time?

- Finish identity assumption
- Figure out how to put a list of models into a select box
- View for couriers to make their tasks more streamlined
- Custom input validators and formatters for Models (phone, date, etc...)

## How could we change the project to be more interesting?

The project prompt itself is fine. Had I known any Elixir beforehand I would have gotten
much further than I did.
