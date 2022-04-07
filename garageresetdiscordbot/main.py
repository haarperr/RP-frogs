import discord
import asyncio
import os
import mysql.connector
from discord.ext import commands

client = commands.Bot(command_prefix='!')
mysql = mysql.connector.connect(
    host = "62.171.159.104",
    user = "root",
    password = "643gw6543vw",
)

@client.event
async def on_ready():
    print("Bot is ready!")
    
@client.command()
async def ping(ctx):
    await ctx.send(f'Pong! {round(client.latency * 1000)}ms')

client.run("OTUzNTIxNzYyMjI4OTIwMzkw.YjFyVw.Kj71YBhfmYWt-Ox003O72yarMMA", bot=True)